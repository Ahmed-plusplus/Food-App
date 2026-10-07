import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_colors.dart';
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
        fixedSize: Size(double.infinity, 56),
        minimumSize: Size(double.infinity, 56),
        maximumSize: Size(double.infinity, 56),
        foregroundColor: Colors.white,
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: AppDimensions.fontSize18,
          fontWeight: FontWeight.w700
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStatePropertyAll(AppColors.borderColor),
        side: WidgetStatePropertyAll(
          BorderSide(color: AppColors.borderColor, width: 1),
        ),
        backgroundColor: WidgetStatePropertyAll(AppColors.white),
        foregroundColor: WidgetStatePropertyAll(AppColors.title),
        fixedSize: WidgetStatePropertyAll(Size(double.infinity, 56)),
        textStyle: WidgetStatePropertyAll(
          TextStyle(
              color: AppColors.title,
              fontSize: AppDimensions.fontSize16,
              fontWeight: FontWeight.w600
          ),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(AppDimensions.radius),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(AppDimensions.radius),
      ),
      outlineBorder: BorderSide(color: AppColors.borderColor),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderColor),
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
    ),
    textTheme: TextTheme(
      displaySmall: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.w800,
      ),
      headlineLarge: TextStyle(
        fontWeight: FontWeight.w700,
        color: AppColors.title,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.title,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.secondary,
      ),
      bodyLarge: TextStyle(
        color: AppColors.subtitle
      ),
      bodyMedium: TextStyle(
        color: AppColors.white.withAlpha((256 * 80 / 100).toInt()),
        fontWeight: FontWeight.w500,
      ),
      labelLarge: TextStyle(
        color: AppColors.title,
        fontWeight: FontWeight.w600,
      ),
      labelMedium: TextStyle(
        color: AppColors.white.withAlpha((256 * 60 / 100).toInt()),
        fontWeight: FontWeight.w600,
      )
    )
  );
}