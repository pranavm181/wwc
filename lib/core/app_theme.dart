import 'package:flutter/material.dart';

class AppTheme {
  // Premium Color Palette
  static const Color primaryColor = Color(0xFF0F172A); // Dark Slate Blue
  static const Color accentColor = Color(0xFF38BDF8); // Sky Blue
  static const Color surfaceColor = Colors.white;
  static const Color backgroundColor = Color(0xFFF8FAFC);
  static const Color cardColor = Colors.white;
  static const Color errorColor = Color(0xFFEF4444);
  
  // Shadows
  static List<BoxShadow> softShadow = [
    BoxShadow(
      color: Colors.black.withAlpha(12),
      blurRadius: 15,
      offset: const Offset(0, 8),
    ),
  ];

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        secondary: accentColor,
        surface: surfaceColor,
        background: backgroundColor,
        error: errorColor,
      ),
      scaffoldBackgroundColor: backgroundColor,
      fontFamily: 'Oswald', // Keeping Oswald as requested, but we can mix with Inter
      
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: primaryColor),
        titleTextStyle: TextStyle(
          color: primaryColor,
          fontFamily: 'Oswald',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      
      // cardTheme: CardTheme(
      //   color: cardColor,
      //   elevation: 0,
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      // ),
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 0,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            fontFamily: 'Oswald',
          ),
        ),
      ),
      
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          minimumSize: const Size(double.infinity, 56),
          side: const BorderSide(color: Color(0xFFE2E8F0), width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            fontFamily: 'Oswald',
          ),
        ),
      ),
      
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: accentColor, width: 2),
        ),
        labelStyle: const TextStyle(color: Color(0xFF64748B)),
        prefixIconColor: const Color(0xFF64748B),
      ),
      
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: primaryColor),
        displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: primaryColor),
        titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: primaryColor),
        bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF334155)),
        bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF64748B)),
      ),
    );
  }
}
