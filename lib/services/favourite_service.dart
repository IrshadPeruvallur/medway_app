// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, non_constant_identifier_names

import 'package:hive_flutter/hive_flutter.dart';
import 'package:medway_app/model/favourite_model/fvrt_model.dart';

class FavouriteService {
  addToFavourite(FavouriteModel data) async {
    final fvrtDB = await Hive.openBox<FavouriteModel>("fvrt_db");

    await fvrtDB.add(data);
  }

  getAllFvrt() async {
    final fvrtDB = await Hive.openBox<FavouriteModel>("fvrt_db");

    return fvrtDB.values.toList();
  }

  deleteFromFvrt(int index) async {
    final fvrtDB = await Hive.openBox<FavouriteModel>("fvrt_db");
    fvrtDB.deleteAt(index);
  }
}
