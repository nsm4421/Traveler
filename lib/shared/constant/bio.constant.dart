import 'package:flutter/material.dart';

enum Sex {
  male(iconData: Icons.male, label: "남자"),
  female(iconData: Icons.female, label: "여자");

  final IconData iconData;
  final String label;

  const Sex({required this.iconData, required this.label});
}
