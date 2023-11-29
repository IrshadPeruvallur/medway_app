import 'package:flutter/material.dart';
import 'package:medway_app/widgets/main_widgets.dart';
import 'package:medway_app/widgets/small_widgets.dart';

class DateAndTime extends StatefulWidget {
  DateAndTime({Key? key}) : super(key: key);

  @override
  _DateAndTimeState createState() => _DateAndTimeState();
}

class _DateAndTimeState extends State<DateAndTime> {
  List<String> items = ['Male', 'Female', 'Other'];
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: WNormalAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WTextformFeild(context, label: 'Problem', hint: "Your Problem"),
              SizedBox(
                height: screenSize.width * 0.05,
              ),
              WTextformFeild(context, label: 'Name', hint: 'Full Name'),
              WTextformFeild(context, label: 'Phone', hint: 'Mobile Number'),
              SizedBox(
                height: screenSize.width * 0.04,
              ),
              // (items),
              SizedBox(
                height: screenSize.width * 0.04,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Text('Select Date'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () => _selectTime(context),
                    child: Text('Select Time'),
                  ),
                ],
              ),
              SizedBox(
                height: screenSize.width * 0.04,
              ),
              Text('Selected Date: ${selectedDate.toLocal()}'),
              Text('Selected Time: ${selectedTime.format(context)}'),
            ],
          ),
        ),
      ),
    );
  }
}
