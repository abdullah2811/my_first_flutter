import 'package:flutter/material.dart';

class MyTextStyles {
  static const TextStyle headline = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 1.2,
    shadows: [Shadow(offset: Offset(2, 2), blurRadius: 30, color: Colors.teal)],
  );

  static const TextStyle subheading = TextStyle(
    fontSize: 24,
    color: Colors.white70,
  );

  static const TextStyle subheadingBlack = TextStyle(
    fontSize: 24,
    color: Colors.black87,
    fontWeight: FontWeight.w600,
    shadows: [Shadow(offset: Offset(1, 1), blurRadius: 4, color: Colors.white)],
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle descriptionText = TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );
}
