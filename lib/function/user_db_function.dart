import 'package:flutter/widgets.dart';
import 'package:medway_app/model/profile_model.dart';

ValueNotifier<List<ProfileModel>> userListNotifier = ValueNotifier([]);
addUser(ProfileModel value) {
  userListNotifier.value.add(value);
  userListNotifier.notifyListeners();
}
