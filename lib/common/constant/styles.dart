import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// colors
const Color kBlack = Color(0xFF212121);
const Color kOxfordBlue = Color(0xFF001D3D);
const Color kSecondaryBlue = Color(0xFF1F46A2);
const Color kBlue = Color(0xFF2663F2);
const Color kStatusBarColor = Color(0xFF3F75F6);
const Color kDavysGrey = Color(0xFF4B5358);
const Color kScaffoldColor = Color.fromARGB(255, 227, 230, 239);
const Color kGrey = Color(0xFFE5E5E5);
const Color kRed = Color(0xFFFF5353);
const Color kGreyTwo = Color(0xFFF4F4F4);

// text style
final TextStyle kHeading5 = GoogleFonts.roboto(
    fontSize: 20, color: kSecondaryBlue, fontWeight: FontWeight.bold);
final TextStyle kHeading6 = GoogleFonts.roboto(
    fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15);
final TextStyle kSubtitle = GoogleFonts.roboto(
    fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.15);
final TextStyle kBodyText = GoogleFonts.roboto(
    fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.25);

// text theme
final kTextTheme = TextTheme(
  headline5: kHeading5,
  headline6: kHeading6,
  subtitle1: kSubtitle,
  bodyText2: kBodyText,
);

const kColorScheme = ColorScheme(
  primary: kBlue,
  primaryContainer: kBlue,
  secondary: kSecondaryBlue,
  secondaryContainer: kSecondaryBlue,
  surface: Colors.white,
  background: Colors.white,
  error: kRed,
  onPrimary: Colors.white,
  onSecondary: Colors.white,
  onSurface: Colors.white,
  onBackground: Colors.white,
  onError: kRed,
  brightness: Brightness.light,
);

ButtonStyle textButtonStyle = TextButton.styleFrom(
  backgroundColor: kBlue,
  shape: const RoundedRectangleBorder(
      side: BorderSide(color: kBlue, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(5))),
);
