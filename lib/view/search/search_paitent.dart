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
    final getProvider = Provider.of<SearchProvider>(context);
    return Scaffold(
      appBar: titleAppBar(title: 'Search'),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/background.jpg'), fit: BoxFit.cover)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: TextFormField(
                onChanged: (value) => getProvider.filter(value),
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
                  hintText: "Find  Appointment...",
                  hintStyle: const TextStyle(
                    color: Color(0xFF636262),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: getProvider.searchedPatient.isEmpty
                  ? Center(
                      child:
                          Lottie.asset("asset/Animation - 1702105823848.json"),
                    )
                  : Consumer<SearchProvider>(builder: (context, value, child) {
                      return ListView.builder(
                        itemCount: value.searchedPatient.length,
                        itemBuilder: (context, index) {
                          final data = value.searchedPatient[index];
                          return appointmentCard(data, context, index);
                        },
                      );
                    }),
            ),
          ],
        ),
      ),
    );
  }
}
