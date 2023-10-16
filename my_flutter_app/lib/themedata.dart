
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final myTheme = ThemeData(
  // primarySwatch: Colors.pink,
  scaffoldBackgroundColor: Colors.white,
  brightness: Brightness.light,
  
  // primaryColor: Colors.amber,
  //to override color
  colorScheme: const ColorScheme.light().copyWith(primary: Colors.red,onPrimary: Colors.white,secondary: Colors.green,onBackground: Colors.green,onError: Colors.brown,onErrorContainer: Colors.brown,),
  // primaryIconTheme: const IconThemeData(color: Colors.white),
      iconTheme: const IconThemeData(
        // color: Colors.blue,
        // size: 10,     
      ),
      
  // fontFamily: 'Times New Roman',
  textTheme:  TextTheme(
    
    // displayLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Colors.purple),
    // bodyLarge: TextStyle(fontSize: 18.0,color: Colors.purple),
    // displaySmall: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.purple),
    // displayMedium : TextStyle(fontSize: 16,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.purple),
    // bodyMedium: const TextStyle(backgroundColor: Colors.orange,fontSize: 14,color: Colors.purple,),
    headlineMedium: const TextStyle(fontSize: 40,color: Colors.yellow),
    bodyMedium: GoogleFonts.lato(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.italic,
    )

  ),
);