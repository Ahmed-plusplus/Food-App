import 'package:flutter/material.dart';
import 'package:food_app/core/route/app_routes.dart';
import 'package:food_app/core/utils/app_colors.dart';
import 'package:food_app/core/utils/app_dimensions.dart';
import 'package:food_app/core/utils/app_strings.dart';
import 'package:food_app/features/auth/presentation/views/widgets/circle_outline_border.dart';
import 'package:food_app/generated/assets.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.button1,
                AppColors.button2,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                        color: AppColors.white.withAlpha((256 * 20 / 100).toInt()),
                        borderRadius: BorderRadius.circular(AppDimensions.radius),
                      ),
                      child: Center(
                        child: Assets.icons.splashIcon.svg(),
                      ),
                    ),
                    SizedBox(height: 24,),
                    Text(
                      AppStrings.appName,
                      style: textTheme.displaySmall,
                    ),
                    SizedBox(height: 8,),
                    Text(
                      AppStrings.splashBody,
                      style: textTheme.bodyMedium
                    ),
                  ],
                ),
              ),
              const Positioned(
                left: -39,
                top: -88.39,
                child: CircleOutlineBorder(size: 256, borderWidth: 4,),
              ),
              const Positioned(
                right: -78,
                top: 221,
                child: CircleOutlineBorder(size: 192, borderWidth: 8,),
              ),
              const Positioned(
                right: -19.5,
                bottom: -44.19,
                child: CircleOutlineBorder(size: 320, borderWidth: 2,),
              ),
              Positioned(
                bottom: 36,
                left: 128,
                right: 128,
                child: TweenAnimationBuilder(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: Duration(seconds: 2),
                  builder: (context, value, child) {
                    return Column(
                      children: [
                      LinearProgressIndicator(
                          value: value,
                          backgroundColor: AppColors.white.withAlpha((256 * 20 / 100).toInt()),
                          color: AppColors.white,
                        ),
                        SizedBox(height: 16,),
                        child!
                      ],
                    );
                  },
                  child: Text(AppStrings.splashLoading, style: textTheme.labelMedium),
                  onEnd: () => context.go(AppRoutes.login),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
