import 'package:hive_flutter/hive_flutter.dart';
part 'profile_model.g.dart';

@HiveType(typeId: 2)
class UserModel {
  @HiveField(0)
  int? index;
  @HiveField(1)
  late final String name;
  @HiveField(2)
  late final String phone;
  @HiveField(3)
  late final String email;
  @HiveField(4)
  late final String dob;
  @HiveField(5)
  dynamic image;

  UserModel(
      {this.index,
      required this.name,
      required this.phone,
      required this.email,
      required this.dob,
      this.image});
}
