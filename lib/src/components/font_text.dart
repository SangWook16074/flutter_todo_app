import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontText extends StatelessWidget {
  final String data;
  final double fontSize;
  const FontText({super.key, required this.data, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.doHyeon(fontSize: fontSize, color: Colors.white),
    );
  }
}
