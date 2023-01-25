import 'package:flutter/material.dart';

// All the base colors from UIUC.
class AppColors {
  static const Color urbanaOrange = Color(0xFFE84A27);
  static const Color primaryUofI = Color(0xFF13294b);
  static const Color secondaryUofILight = Color(0xFF0455A4);
  static const Color secondaryUofILightest = Color(0xFF68aff7);
  static const Color secondaryUofIDark = Color(0xFF1F4096);
}

const kOrangeBlue = LinearGradient(
  colors: [
    Color.fromARGB(255, 255, 115, 0),
    Color.fromARGB(255, 0, 89, 255),
  ],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const kOrangeWhite = LinearGradient(
  colors: [
    Color.fromARGB(255, 255, 115, 0),
    Color.fromARGB(255, 255, 255, 255),
  ],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);
