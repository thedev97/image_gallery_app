import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles{
  static final TextStyle title = GoogleFonts.lato(
      fontWeight: FontWeight.w800,
      fontSize: 18,
      shadows: [
        const Shadow(
            color: Colors.black, offset: Offset(0.0, 0.5), blurRadius: 0.5),
      ],
      color: Colors.white);

  static final TextStyle description = GoogleFonts.lato(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      shadows: [
        const Shadow(
            color: Colors.white, offset: Offset(0.0, 0.5), blurRadius: 0.5),
      ],
      color: Colors.black);

  static final TextStyle likes = GoogleFonts.lato(
      fontWeight: FontWeight.w700,
      fontSize: 12,
      shadows: [
        const Shadow(
            color: Colors.white, offset: Offset(0.0, 0.5), blurRadius: 0.5),
      ],
      color: Colors.blue);

  static final TextStyle successMsg = GoogleFonts.lato(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      shadows: [
        const Shadow(
            color: Colors.black, offset: Offset(0.0, 0.5), blurRadius: 0.5),
      ],
      color: Colors.green);


  static final TextStyle errorMsg = GoogleFonts.lato(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      shadows: [
        const Shadow(
            color: Colors.black, offset: Offset(0.0, 0.5), blurRadius: 0.5),
      ],
      color: Colors.red);
}