import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appStype(double size, Color color, FontWeight fontWeight) {
  return GoogleFonts.poppins(
      fontSize: size, color: color, fontWeight: fontWeight);
}

TextStyle appStypeWithHeight(
    double size, Color color, FontWeight fontWeight, double height) {
  return GoogleFonts.poppins(
      fontSize: size, color: color, fontWeight: fontWeight, height: height);
}
