import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
  });

  final String text;
  final VoidCallback onPressed;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: isEnabled
          ? Text(text)
          : CircularProgressIndicator(
        color: AppColors.white,
        constraints: BoxConstraints(maxHeight: 30, maxWidth: 30, minWidth: 20, minHeight: 20),
      ),
    );
  }
}
