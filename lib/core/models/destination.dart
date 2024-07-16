import 'package:flutter/material.dart';

class Destination {
  final String label;
  final Widget icon;
  final Widget selectedIcon;
  final Widget destinationContent;

  Destination({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.destinationContent,
  });
}
