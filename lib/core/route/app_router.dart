import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/services/service_locator.dart';
import 'package:food_app/features/auth/data/repository/auth_repository.dart';
import 'package:food_app/features/auth/presentation/viewmodels/cubit/login/login_cubit.dart';
import 'package:food_app/features/auth/presentation/viewmodels/cubit/signup/signup_cubit.dart';
import 'package:food_app/features/auth/presentation/views/login_view.dart';
import 'package:food_app/features/auth/presentation/views/signup_view.dart';
import 'package:food_app/features/auth/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) {
        return SplashView();
      },
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => BlocProvider(
        create: (context) => LoginCubit(getIt<AuthRepository>()),
        child: const LoginView(),
      ),
    ),
    GoRoute(
      path: AppRoutes.signup,
      builder: (context, state) => BlocProvider(
        create: (context) => SignupCubit(getIt<AuthRepository>()),
        child: const SignupView(),
      ),
    ),
  ],
);
