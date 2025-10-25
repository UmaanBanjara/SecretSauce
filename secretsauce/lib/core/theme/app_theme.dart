import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecretSauceTheme{
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xFF1C1C1E),
    primaryColor: Color(0xFFAACF9C),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFAACF9C),
        foregroundColor: const Color(0xFF1C1C1E),
        padding : EdgeInsets.symmetric(horizontal: 24 , vertical: 12),
        shape : RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        textStyle: TextStyle(
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontSize: 18
        )
      )
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled : true,
      fillColor: Color(0xFF1C1C1E),
      
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),

      ),
      hintStyle: TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,

      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color : Color(0xFFAACF9C)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color : Colors.grey)
      ),
      labelStyle: TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: const  Color(0xFFAACF9C),
      selectionColor: Colors.green.withOpacity(0.3),
    )
    
  );
}