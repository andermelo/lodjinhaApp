import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LodjinhaTextLogo {
     Widget widgetTextLogo({String text, double fontSize = 64.0, Color color}) => Text(
        text,
        style: GoogleFonts.pacifico(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          color: color,
          letterSpacing: 1.5,
        ),
     );
}