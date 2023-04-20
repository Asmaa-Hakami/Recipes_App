import 'package:flutter/material.dart';
import 'package:recipes_app/core/constants/constants.dart';

class AppStyle {
  static TextStyle titleBold14 = const TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.bold,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle titleGreen16 = const TextStyle(
    color: Constants.mossGreen,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    overflow: TextOverflow.ellipsis,
  );
}
