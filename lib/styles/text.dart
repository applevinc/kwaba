import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppText {
  static TextStyle get _defaultStyle {
    return GoogleFonts.poppins(
      fontSize: 14,
    );
  }

  static TextStyle get bold400 {
    return _defaultStyle.copyWith(
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle get bold300 {
    return _defaultStyle.copyWith(
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle get bold500 {
    return _defaultStyle.copyWith(
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle get bold600 {
    return _defaultStyle.copyWith(
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get bold700 {
    return _defaultStyle.copyWith(
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get bold800 {
    return _defaultStyle.copyWith(
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle get bold900 {
    return _defaultStyle.copyWith(
      fontWeight: FontWeight.w900,
    );
  }
}
