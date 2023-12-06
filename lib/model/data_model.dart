import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 1)
class PatientModel {
  @HiveField(0)
  int? index;
  @HiveField(1)
  late final String doctorpic;
  late final String doctorname;
  late final String doctorspecality;
  late final String name;
  @HiveField(2)
  late final String phone;
  @HiveField(3)
  late final String age;
  @HiveField(4)
  late final String gender;
  @HiveField(5)
  late final String problem;
  @HiveField(6)
  late final String time;
  @HiveField(7)
  late final String date;

  PatientModel(
      {this.index,
      required this.doctorname,
      required this.doctorspecality,
      required this.doctorpic,
      required this.name,
      required this.phone,
      required this.age,
      required this.gender,
      required this.problem,
      required this.time,
      required this.date});
}
