import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static _border([Color color = AppPallete.borderColor]) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color, width: 3));
  static final darkThemeMode = ThemeData(
          chipTheme: const ChipThemeData(
            side: BorderSide.none,
            color: WidgetStatePropertyAll(AppPallete.backgroundColor),
          ),
          appBarTheme:
              const AppBarTheme(backgroundColor: AppPallete.backgroundColor),
          colorScheme: const ColorScheme.dark(),
          fontFamily: "Poppins")
      .copyWith(
          scaffoldBackgroundColor: AppPallete.backgroundColor,
          inputDecorationTheme: InputDecorationTheme(
              border: _border(),
              errorBorder: _border(AppPallete.errorColor),
              contentPadding: const EdgeInsets.all(27),
              focusedBorder: _border(AppPallete.gradient2),
              enabledBorder: _border()));
}
