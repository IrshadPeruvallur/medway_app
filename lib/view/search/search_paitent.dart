import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medway_app/controller/search_provider.dart';
import 'package:medway_app/view/widgets/main_widgets.dart';
import 'package:medway_app/view/widgets/small_widgets.dart';
import 'package:provider/provider.dart';

class SearchPatient extends StatelessWidget {
  const SearchPatient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context, listen: true);
    // searchProvider
    //     .loadPatient(context); // Ensure you load the patients initially

    return Scaffold(
      appBar: titleAppBar(title: 'Search'),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: TextFormField(
                onChanged: (value) => searchProvider.filter(value, context),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 16, 105, 140),
                      width: 2.0,
                    ),
                  ),
                  suffixIcon: const Icon(
                    Icons.search_sharp,
                    color: Color.fromARGB(255, 16, 105, 140),
                  ),
                  hintText: "Find Appointment...",
                  hintStyle: const TextStyle(
                    color: Color(0xFF636262),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: searchProvider.searchedPatient.isEmpty
                  ? Center(
                      child:
                          Lottie.asset("asset/Animation - 1702105823848.json"),
                    )
                  : ListView.builder(
                      itemCount: searchProvider.searchedPatient.length,
                      itemBuilder: (context, index) {
                        final data = searchProvider.searchedPatient[index];
                        return appointmentCard(data, context, index);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
