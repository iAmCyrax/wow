import 'package:flutter/material.dart';

class LanguageManager {
  static LanguageManager? _instance;
  static LanguageManager get instance {
    _instance ??= LanguageManager._init();
    return _instance!;
  }

  LanguageManager._init();

  final en = const Locale('en', 'US');
  final tr = const Locale('tr', 'TR');

  List<Locale> get supportedLocales => [en, tr];
}
