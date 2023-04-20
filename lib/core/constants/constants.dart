import 'package:flutter/material.dart';

class Constants {
  Constants._();
  static const String baseUrl = "https://tasty.p.rapidapi.com/recipes/list";
  static const String apiKey =
      "690c9eeca3msh323eba485d89c80p14f082jsn57354353dba0";
  static const String apiHost = "tasty.p.rapidapi.com";
  static const MaterialColor mossGreen = MaterialColor(
    0xFF8B9474,
    <int, Color>{
      50: Color(0xffA9B38B), //10%
      100: Color(0xffA4AD87), //20%
      200: Color(0xff9FA883), //30%
      300: Color(0xff959E7B), //40%
      400: Color(0xFF909977), //50%
      500: Color(0xFF8B9474), //60%
      600: Color(0xff828A6B), //70%
      700: Color(0xff788063), //80%
      800: Color(0xff5F664F), //90%
      900: Color(0xff000000), //100%
    },
  );
}
