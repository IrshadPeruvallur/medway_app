import 'package:hive_flutter/hive_flutter.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class PatientModel {
  @HiveField(0)
  int? index;
  @HiveField(1)
  late final String doctorpic;
  @HiveField(2)
  late final String doctorname;
  @HiveField(3)
  late final String doctorspecality;
  @HiveField(4)
  late final String name;
  @HiveField(5)
  late final String phone;
  @HiveField(6)
  late final String age;
  @HiveField(7)
  late final String gender;
  @HiveField(8)
  late final String problem;
  @HiveField(9)
  late final String time;
  @HiveField(10)
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
