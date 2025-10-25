import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showCustomSnackbar (BuildContext context , String message , {bool isError = false}){
  final snackBar = SnackBar(content: Text(message , style : TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    color : Colors.white
  )),

  backgroundColor: isError ? Colors.redAccent : Colors.lightGreen,
  behavior: SnackBarBehavior.floating,
  shape : RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),

  ),
  margin : EdgeInsets.all(16),
  duration: const Duration(seconds: 2),
  
  );

  ScaffoldMessenger.of(context)
  ..hideCurrentSnackBar()
  ..showSnackBar(snackBar);
}