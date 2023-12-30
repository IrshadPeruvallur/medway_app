import 'package:hive_flutter/hive_flutter.dart';
import 'package:medway_app/model/cancel_model/canceled_model.dart';

class CancelService {
  final String boxName = "cancel_db";

  Future<void> addToCancel(CanceldModel value) async {
    final cancelDB = await Hive.openBox<CanceldModel>(boxName);
    await cancelDB.add(value);
  }

  Future<List<CanceldModel>> getAllCanceld() async {
    final cancelDB = await Hive.openBox<CanceldModel>(boxName);
    return cancelDB.values.toList();
  }

  Future<void> deleteFromCanceld(int index) async {
    final cancelDB = await Hive.openBox<CanceldModel>(boxName);
    await cancelDB.deleteAt(index);
  }
}
