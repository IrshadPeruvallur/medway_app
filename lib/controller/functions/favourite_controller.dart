// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medway_app/model/favourite_model/fvrt_model.dart';

ValueNotifier<List<FavouriteModel>> favouriteListNotifier = ValueNotifier([]);
// List<FavouriteModel> favouritedList = [];
addToFavourite(FavouriteModel data) async {
  final fvrtDB = await Hive.openBox<FavouriteModel>("fvrt_db");
  // favouriteListNotifier.value.add(data);
  fvrtDB.add(data);
  // favouritedList.add(data);
  favouriteListNotifier.notifyListeners();
  getAllFvrt();
}

getAllFvrt() async {
  final fvrtDB = await Hive.openBox<FavouriteModel>("fvrt_db");
  favouriteListNotifier.value.clear();
  favouriteListNotifier.value.addAll(fvrtDB.values);
  favouriteListNotifier.notifyListeners();
}

deleteFromFvrt(int index) async {
  final fvrtDB = await Hive.openBox<FavouriteModel>("fvrt_db");
  fvrtDB.deleteAt(index);
  // favouritedList.removeAt(index);

  getAllFvrt();
}

bool IsDoctorInFvrt(dName) {
  return favouriteListNotifier.value.any((item) => item.dName == dName);
}
