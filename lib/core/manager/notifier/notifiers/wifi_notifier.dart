import 'package:flutter/material.dart';

class WifiNotifier extends ChangeNotifier {
  bool _wifi = true;

  bool get wifi =>_wifi;

  void changeWifi(bool newValue) {
    _wifi = newValue;
    notifyListeners();
  }

  
  void toggleWifi() {
    _wifi = !_wifi;
    notifyListeners();
  }
}