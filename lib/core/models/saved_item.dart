import 'package:flutter/material.dart';

class SavedItem {
  final String title;
  final String subtitle;
  final Color? color;

  SavedItem({
    required this.title,
    required this.subtitle,
    this.color,
  });
}
