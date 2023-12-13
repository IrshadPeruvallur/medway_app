import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medway_app/model/fvrt_model.dart';

ValueNotifier<List<FavouriteModel>> favouriteListNotifier = ValueNotifier([]);

addToFavourite(FavouriteModel data) async {
  final fvrtDB = await Hive.openBox<FavouriteModel>("fvrt_db");
  // favouriteListNotifier.value.add(data);
  fvrtDB.add(data);
  favouriteListNotifier.notifyListeners();
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
  getAllFvrt();
}
