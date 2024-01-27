import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  // scaffoldBackgroundColor: LightColors.bg1,
  // primaryColor: LightColors.primaryColor,
  // dialogBackgroundColor: LightColors.bg1,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
        textStyle: const MaterialStatePropertyAll<TextStyle>(TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: LightColors.textMain,
        )),
        backgroundColor:
            const MaterialStatePropertyAll<Color>(LightColors.buttonBackground),
        foregroundColor:
            const MaterialStatePropertyAll<Color>(LightColors.buttonBackground),
        elevation: const MaterialStatePropertyAll<double>(0),
        padding: const MaterialStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 64, vertical: 20)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        )),
        shadowColor: MaterialStateProperty.all<Color>(Colors.transparent)),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.all(12),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    hintStyle: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      // color: LightColors.iconMain,
    ),
    labelStyle: const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 1,
      ),
    ),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      //H1
      fontSize: 34,
      fontWeight: FontWeight.bold,
      color: LightColors.textMain,
    ),
    displayMedium: TextStyle(
      //H8
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: LightColors.textMain,
    ),
    displaySmall: TextStyle(
      //H9
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: LightColors.textMain,
    ),
    headlineMedium: TextStyle(
      //B2
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: LightColors.textMain,
    ),
    labelMedium: TextStyle(
      //B5
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: LightColors.grey,
    ),
    bodyMedium: TextStyle(
      //B5 (caption)
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: LightColors.textMain,
    ),
    labelSmall: TextStyle(
      //Small buttons
      fontSize: 13,
      fontWeight: FontWeight.w700,
      color: LightColors.textMain,
    ),
    bodySmall: TextStyle(
      //Info
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: LightColors.textMain,
    ),
    headlineSmall: TextStyle(
      //Bar
      fontSize: 10,
      fontWeight: FontWeight.w600,
      color: LightColors.textMain,
    ),
  ),
  // colorScheme: ColorScheme.fromSeed(
  //     brightness: Brightness.light,
  //     background: LightColors.bg1,
  //     onBackground: LightColors.bg2,
  //     // secondary: LightColors.textIcSecondary,
  //     outline: LightColors.borderUnfocused, //
  //     primary: LightColors.primaryColor, //
  //     seedColor: LightColors.bg1,
  //     primaryContainer: LightColors.button //
  //     ),
);

class LightColors {
  static const Color grey = Color(0xFFA7A7A7);
  static const Color textMain = Color(0xFF4F4F4F);
  static const Color yellow = Color(0xFFFFB800);
  static const Color buttonBackground = Color(0xFFA6A6A6);
}
