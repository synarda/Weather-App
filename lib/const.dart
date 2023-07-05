import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Colorss {
  static const nightColor = Color(0xff0D0C0C);
  static const dayColor = Color.fromARGB(255, 86, 133, 209);
}

class Const {
  static const API_KEY = "Your Api Key";
  static const API_URL = "http://api.weatherapi.com";
  static const Cities = [
    "Bangkok",
    "Paris",
    "London",
    "Dubai",
    "Sydney",
    "New York",
    "Singapore",
    "Istanbul",
    "Tokyo",
    "Antalya",
    "Seoul",
    "Osaka",
    "Makkah",
    "Phuket",
    "Pattaya",
    "Milan",
    "Barcelona",
    "	Palma de Mallorca",
    "Bali",
    "Hong Kong",
  ];
}

class Styles {
  static TextStyle get smallTitleStyle => GoogleFonts.montserrat(
        fontSize: 19,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      );
  static TextStyle get bigTitleStyle => GoogleFonts.montserrat(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      );
}
