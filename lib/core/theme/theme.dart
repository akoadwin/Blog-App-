import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static _border([Color color = AppPallete.borderColor]) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color, width: 3));
  static final darkThemeMode = ThemeData(
          appBarTheme:
              const AppBarTheme(backgroundColor: AppPallete.backgroundColor),
          colorScheme: const ColorScheme.dark(),
          fontFamily: "Poppins")
      .copyWith(
          scaffoldBackgroundColor: AppPallete.backgroundColor,
          inputDecorationTheme: InputDecorationTheme(
              contentPadding: const EdgeInsets.all(27),
              focusedBorder: _border(AppPallete.gradient2),
              enabledBorder: _border()));
}
