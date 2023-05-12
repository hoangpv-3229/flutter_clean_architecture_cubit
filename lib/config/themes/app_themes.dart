import 'package:flutter/material.dart';

abstract class AppTheme{
  static ThemeData get dark {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.black38
      ),
      scaffoldBackgroundColor: Colors.black38,
      primaryColor: Colors.white70,
      splashColor: Colors.yellow,
      fontFamily: 'IBM',
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.purple),
      useMaterial3: true,
    );
  }
}