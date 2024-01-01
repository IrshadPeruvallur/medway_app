import 'package:flutter/material.dart';
import 'package:medway_app/model/favourite_model/fvrt_model.dart';
import 'package:medway_app/services/favourite_service.dart';

class DBFavourite extends ChangeNotifier {
  List<FavouriteModel> favouritedList = [];
  final FavouriteService _favouriteService = FavouriteService();
  Future<void> getAllFavourite() async {
    favouritedList = await _favouriteService.getAllFvrt();
    notifyListeners();
  }

  Future<void> addToFvrt(FavouriteModel value) async {
    await _favouriteService.addToFavourite(value);
    getAllFavourite();
  }

  Future<void> deleterFromFvrt(int index) async {
    await _favouriteService.deleteFromFvrt(index);
    getAllFavourite();
  }

  // ignore: non_constant_identifier_names
  bool IsDoctorInFvrt(dName) {
    return favouritedList.any((item) => item.dName == dName);
  }
}
