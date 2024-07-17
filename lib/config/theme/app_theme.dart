import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xffFFFFFF);
  static const Color secondaryColor = Color(0xffEEE5FF);
  static const Color backgroundColorPrimary = Color(0xffFFFFFF);
  static const Color backgroundColorSecondary = Color(0xff7F3DFF);
  static const Color textSecondaryColor = Color(0xff91919F);
  static const Color textPrimaryColor = Color(0xff212325);

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        secondaryHeaderColor: secondaryColor,
        primaryColor: primaryColor,
        canvasColor: backgroundColorSecondary,
        scaffoldBackgroundColor: backgroundColorPrimary,
        iconTheme: const IconThemeData(color: backgroundColorSecondary),
        textTheme: const TextTheme(
          // titulos
          displayLarge: TextStyle(
            fontSize: 56,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
          displayMedium: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: textPrimaryColor,
          ),
          // cuerpos
          bodyLarge: TextStyle(
            fontSize: 32,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: textSecondaryColor,
          ),
          bodySmall: TextStyle(fontSize: 14, color: textPrimaryColor),
          // etiquetas
          labelMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );
}
