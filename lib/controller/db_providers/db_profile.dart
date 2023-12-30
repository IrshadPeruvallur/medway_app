import 'package:flutter/material.dart';
import 'package:medway_app/model/profile_model/profile_model.dart';
import 'package:medway_app/services/profile_service.dart';

class DBProfile extends ChangeNotifier {
  final ProfileServices _profileServices = ProfileServices();
  List<UserModel> profileList = [];
  Future<void> getAllUser() async {
    profileList = await _profileServices.getAllUser();
    notifyListeners();
  }

  Future<void> addUser(UserModel value) async {
    await _profileServices.addUser(value);
    getAllUser();
  }

  Future<void> updateUser(int index, UserModel value) async {
    await _profileServices.updateProfile(value, index);
    getAllUser();
  }
}

/* import 'package:flutter/material.dart';
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

  bool IsDoctorInFvrt(dName) {
    return favouritedList.any((item) => item.dName == dName);
  }
}
 */
