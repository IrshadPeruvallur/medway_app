import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:medway_app/function/db_function.dart';
import 'package:medway_app/widgets/main_widgets.dart';
import 'package:medway_app/widgets/small_widgets.dart';

final rnameController = TextEditingController();
final rphoneController = TextEditingController();
final rageController = TextEditingController();
final rproblemController = TextEditingController();
final rdateController = TextEditingController();
final rtimeController = TextEditingController();
final rgenderController = TextEditingController();

class ReSheduleAppointment extends StatefulWidget {
  final int index;
  final String doctorname;
  final String doctorpic;
  final String doctorspeciaility;
  final String name;
  final String age;
  final String phone;
  final String gender;
  final String problem;
  final String date;
  final String time;

  const ReSheduleAppointment(
      {super.key,
      required this.index,
      required this.doctorname,
      required this.doctorpic,
      required this.doctorspeciaility,
      required this.name,
      required this.age,
      required this.phone,
      required this.gender,
      required this.problem,
      required this.date,
      required this.time});

  @override
  State<ReSheduleAppointment> createState() => _ReSheduleAppointmentState();
}

class _ReSheduleAppointmentState extends State<ReSheduleAppointment> {
  String dropdownvalue = "Select One";
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rnameController.text = widget.name;
    rageController.text = widget.age;
    rphoneController.text = widget.phone;
    rproblemController.text = widget.problem;
    rgenderController.text = widget.gender;
    rdateController.text = widget.date;
    rtimeController.text = widget.time;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        rdateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
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
        rtimeController.text = DateFormat.jm().format(selectedDateTime);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: WNormalAppBar(context),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                doctersCard(context,
                    picture: widget.doctorpic,
                    name: widget.doctorname,
                    speciality: widget.doctorspeciaility),
                SizedBox(
                  height: screenSize.width * 0.05,
                ),
                WTextformField(
                  inputformat:
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                  keyboardType: TextInputType.name,
                  controller: rnameController,
                  context,
                  label: 'Name',
                ),
                WTextformField(
                  inputformat: FilteringTextInputFormatter.digitsOnly,
                  keyboardType: TextInputType.number,
                  controller: rphoneController,
                  context,
                  label: 'Phone',
                ),
                SizedBox(
                  height: screenSize.width * 0.04,
                ),
                // captiontext(context, text: 'Gender'),
                DropdownButtonFormField<String>(
                  validator: (value) {
                    if (value == "Select One") {
                      return "Plese Choose one";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 16, 105, 140)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  borderRadius: BorderRadius.circular(screenSize.width * 0.02),
                  isExpanded: true,
                  value: dropdownvalue,
                  onChanged: (String? newvalue) {
                    setState(() {
                      dropdownvalue = newvalue.toString();
                      rgenderController.text = dropdownvalue;
                    });
                  },
                  items: const [
                    DropdownMenuItem(
                        value: "Select One", child: Text('Select One')),
                    DropdownMenuItem(value: "Male", child: Text('Male')),
                    DropdownMenuItem(value: "Female", child: Text('Female')),
                    DropdownMenuItem(value: "Other", child: Text('Other')),
                  ],
                ),
                WTextformField(
                  inputformat: FilteringTextInputFormatter.digitsOnly,
                  keyboardType: TextInputType.number,
                  controller: rageController,
                  context,
                  label: 'Age',
                ),
                SizedBox(
                  height: screenSize.width * 0.04,
                ),
                WTextformField(
                  inputformat:
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                  controller: rproblemController,
                  keyboardType: TextInputType.text,
                  context,
                  label: 'Problem',
                ),
                SizedBox(
                  height: screenSize.width * 0.04,
                ),
                // captiontext(context, text: 'Time'),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please select Time";
                    } else {
                      return null;
                    }
                  },
                  controller: rtimeController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: 'Time',
                    suffixIcon: IconButton(
                      onPressed: () {
                        _selectTime(context);
                      },
                      icon: const Icon(Icons.calendar_today),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 16, 105, 140)),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.width * 0.04,
                ),
                // captiontext(context, text: 'Date'),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please select Date";
                    } else {
                      return null;
                    }
                  },
                  controller: rdateController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: 'Date',
                    suffixIcon: IconButton(
                      onPressed: () {
                        _selectDate(context);
                      },
                      icon: const Icon(Icons.calendar_today),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 16, 105, 140)),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.width * 0.04,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: WElevatedButton(context, text: 'Reshedule',
                      navigator: () {
                    if (_formKey.currentState!.validate()) {
                      updateAppointment(widget.index, widget.doctorname,
                          widget.doctorspeciaility, widget.doctorpic);
                      Navigator.pop(context);
                    }
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
