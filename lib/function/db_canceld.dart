// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medway_app/model/canceled_model.dart';

ValueNotifier<List<CanceldModel>> completeCanceldNotifierList =
    ValueNotifier([]);

addToCancel(CanceldModel value) async {
  final cancelDB = await Hive.openBox<CanceldModel>("cancel_db");
  cancelDB.add(value);
  completeCanceldNotifierList.notifyListeners();
}

getAllCanceld() async {
  final cancelDB = await Hive.openBox<CanceldModel>("cancel_db");
  completeCanceldNotifierList.value.clear();
  completeCanceldNotifierList.value.addAll(cancelDB.values);
  completeCanceldNotifierList.notifyListeners();
}

deleteFromCanceld(int index) async {
  final cancelDB = await Hive.openBox<CanceldModel>("cancel_db");
  cancelDB.deleteAt(index);
  getAllCanceld();
}

// addToConplete(CanceldModel value) async {
//   final cancelDB = await Hive.openBox<CanceldModel>("cancel_db");
//   cancelDB.add(value);
//   completeCanceldNotifierList.notifyListeners();
//   print('object');
// }

// getAllConplete() async {
//   final cancelDB = await Hive.openBox<CanceldModel>("cancel_db");
//   completeCanceldNotifierList.value.clear();
//   completeCanceldNotifierList.value.addAll(cancelDB.values);
//   completeCanceldNotifierList.notifyListeners();
// }

// deleteFromConplete(int index) async {
//   final cancelDB = await Hive.openBox<CanceldModel>("cancel_db");
//   cancelDB.deleteAt(index);
//   getAllCanceld();
// }
