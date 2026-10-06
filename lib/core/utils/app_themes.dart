import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_colors.dart';
import 'package:food_app/core/utils/app_dimensions.dart';
import 'package:food_app/core/utils/app_dimensions.dart';
import 'package:food_app/core/utils/app_fonts.dart';

abstract class AppThemes {
  static final theme = ThemeData(
    primaryColor: AppColors.primary,
    useMaterial3: true,
    fontFamily: AppFonts.fontFamily,

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundBuilder: (context, states, child) => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.button1, AppColors.button2],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(AppDimensions.radius),
          ),
          child: child,
        ),
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: AppDimensions.fontSize18,
          fontWeight: FontWeight.w700
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.textFieldBorderColor),
        borderRadius: BorderRadius.circular(AppDimensions.radius),
      ),
      filled: true,
      fillColor: AppColors.white,
      hintStyle: TextStyle(
        color: AppColors.secondary,
        fontSize: AppDimensions.fontSize16,
        fontWeight: FontWeight.w400,
      ),
    ),
    cardTheme: CardThemeData(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.cardBorderColor),
        borderRadius: BorderRadius.circular(AppDimensions.radius),
      ),
      color: AppColors.white,
    )
  );
}