import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AuthGradientButton extends StatelessWidget {
  const AuthGradientButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          gradient: const LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.bottomLeft,
              colors: [
                AppPallete.gradient1,
                AppPallete.gradient2,
              ])),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: AppPallete.transparentColor,
              shadowColor: AppPallete.transparentColor,
              fixedSize: const Size(395, 55)),
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: AppPallete.whiteColor),
          )),
    );
  }
}
