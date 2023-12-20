import 'package:hive_flutter/hive_flutter.dart';
part 'fvrt_model.g.dart';

@HiveType(typeId: 3)
class FavouriteModel {
  @HiveField(0)
  int? index;
  @HiveField(1)
  final String dName;
  @HiveField(2)
  final String dSpeciality;
  @HiveField(4)
  final String dPhoto;

  FavouriteModel(
      {required this.dName,
      required this.dSpeciality,
      required this.dPhoto,
      this.index});
}
