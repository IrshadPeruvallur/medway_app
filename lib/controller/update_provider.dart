import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UpdateProvider extends ChangeNotifier {
  final rnameController = TextEditingController();
  final rphoneController = TextEditingController();
  final rageController = TextEditingController();
  final rproblemController = TextEditingController();
  final rdateController = TextEditingController();
  final rtimeController = TextEditingController();
  final rgenderController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String dropdownvalue = "Select One";

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != DateTime.now()) {
      rdateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
    notifyListeners();
  }

  void selectTime(BuildContext context) async {
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
      rtimeController.text = DateFormat.jm().format(selectedDateTime);
    }
    notifyListeners();
  }

  void changeGender(newvalue) {
    dropdownvalue = newvalue.toString();
    rgenderController.text = dropdownvalue;
    notifyListeners();
  }
}
