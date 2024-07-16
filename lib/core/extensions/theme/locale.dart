import 'package:flutter/material.dart';

extension LocaleExtension on ThemeMode {
  String get locale => 'theme_${name.toString()}';
}
