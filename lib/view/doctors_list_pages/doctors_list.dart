import 'package:flutter/material.dart';
import 'package:medway_app/controller/providers/doctors_list_provider.dart';
import 'package:medway_app/view/widgets/main_widgets.dart';
import 'package:provider/provider.dart';

class DoctorsList extends StatelessWidget {
  const DoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<DoctorsListProvider>(context);
    return Scaffold(
      appBar: titleAppBar(title: "Doctors List"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                getProvider.valueToLowerCase(value);
              },
              decoration: const InputDecoration(
                focusColor: Color.fromARGB(255, 16, 105, 140),
                hintText: 'Search doctors...',
                prefixIcon: Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 16, 105, 140),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: getProvider.doctorsname.length,
              itemBuilder: (context, index) {
                if (getProvider.doctorsname[index]
                        .toLowerCase()
                        .contains(getProvider.serchedList) ||
                    getProvider.doctorsSpeciality[index]
                        .toLowerCase()
                        .contains(getProvider.serchedList)) {
                  return getProvider.DoctorCard(
                    context,
                    index: index,
                    imagepath: getProvider.doctersimage[index],
                    name: getProvider.doctorsname[index],
                    speciality: getProvider.doctorsSpeciality[index],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
