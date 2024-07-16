import 'package:flutter/material.dart';

class BluetoothNotifier extends ChangeNotifier {
  bool _bluetooth = true;

  bool get bluetooth =>_bluetooth;

  void changeBluetooth(bool newValue) {
    _bluetooth = newValue;
    notifyListeners();
  }

  void toggleBluetooth() {
    _bluetooth = !_bluetooth;
    notifyListeners();
  }
}