import 'package:flutter/material.dart';
import 'package:medway_app/model/cancel_model/canceled_model.dart';
import 'package:medway_app/services/cancel_service.dart';

class DbCancel extends ChangeNotifier {
  final CancelService _cancelService = CancelService();
  List<CanceldModel> canceledList = [];

  Future<void> getAllCanceled() async {
    canceledList = await _cancelService.getAllCanceld();
    notifyListeners();
  }

  Future<void> addCanceled(CanceldModel value) async {
    await _cancelService.addToCancel(value);
    await getAllCanceled();
  }

  Future<void> removeCanceled(int index) async {
    await _cancelService.deleteFromCanceld(index);
    await getAllCanceled();
  }
}
