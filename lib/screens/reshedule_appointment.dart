import 'package:flutter/material.dart';
import 'package:medway_app/screens/my_appointment_screen.dart';
import 'package:medway_app/widgets/main_widgets.dart';
import 'package:medway_app/widgets/small_widgets.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ResheduleAppointment extends StatefulWidget {
  ResheduleAppointment({Key? key}) : super(key: key);

  @override
  State<ResheduleAppointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<ResheduleAppointment> {
  // dynamic name = TextEditingController();
  // dynamic phone = TextEditingController();
  // dynamic gender = TextEditingController();
  // dynamic age = TextEditingController();
  // dynamic bookingfor = TextEditingController();
  dynamic dateController = TextEditingController();
  dynamic timeController = TextEditingController();

  List<String> items = ['Male', 'Female', 'Other'];
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  void _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (pickedTime != null) {
      DateTime now = DateTime.now();
      DateTime selectedDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        pickedTime.hour,
        pickedTime.minute,
      );

      setState(() {
        timeController.text = DateFormat.jm().format(selectedDateTime);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: WNormalAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              doctersCard(context, name: 'name', speciality: 'speciality'),
              SizedBox(
                height: screenSize.width * 0.05,
              ),
              WTextformFeild(
                context,
                label: 'Name',
                hint: 'Full Name',
              ),
              WTextformFeild(
                context,
                label: 'Phone',
                hint: 'Mobile Number',
              ),
              SizedBox(
                height: screenSize.width * 0.04,
              ),
              captiontext(context, text: 'Gender'),
              DropdownButtonFormField(
                // key: gender,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 16, 105, 140)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                value: items[0],
                items: items.map((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {},
              ),
              WTextformFeild(
                context,
                label: 'Age',
                hint: 'Age',
              ),
              SizedBox(
                height: screenSize.width * 0.04,
              ),
              captiontext(context, text: 'Booking For'),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 16, 105, 140)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                value: items[0],
                items: items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {},
              ),
              WTextformFeild(context, label: 'Problem', hint: "Your Problem"),
              SizedBox(
                height: screenSize.width * 0.04,
              ),
              captiontext(context, text: 'Time'),
              TextFormField(
                controller: timeController,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      _selectTime(context);
                    },
                    icon: Icon(Icons.calendar_today),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 16, 105, 140)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              SizedBox(
                height: screenSize.width * 0.04,
              ),
              captiontext(context, text: 'Date'),
              TextFormField(
                controller: dateController,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      _selectDate(context);
                    },
                    icon: Icon(Icons.calendar_today),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 16, 105, 140)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              SizedBox(
                height: screenSize.width * 0.04,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: WElevatedButton(
                  context,
                  text: 'Submit Info.',
                  navigator: () => Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return MyAppointment();
                    },
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
