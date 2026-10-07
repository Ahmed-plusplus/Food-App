import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/common/widgets/custom_elevated_button.dart';
import 'package:food_app/core/route/app_routes.dart';
import 'package:food_app/core/utils/app_colors.dart';
import 'package:food_app/core/utils/app_dimensions.dart';
import 'package:food_app/core/utils/app_strings.dart';
import 'package:food_app/features/auth/presentation/viewmodels/cubit/login/login_cubit.dart';
import 'package:food_app/features/auth/presentation/viewmodels/cubit/login/login_states.dart';
import 'package:food_app/features/auth/presentation/views/widgets/login_form.dart';
import 'package:food_app/generated/assets.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  late LoginCubit _cubit;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Container(
            width: 48,
            height: 48,
            margin: EdgeInsets.only(left: 16, top: 16, bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.radius),
              color: AppColors.primary.withAlpha((256 * 10 / 100).toInt()),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Assets.icons.appIcon.svg(),
              ),
            ),
          ),
          title: Text(AppStrings.appName, style: textTheme.titleMedium,),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppDimensions.padding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AspectRatio(
                aspectRatio: 358 / 218,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: 218),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppDimensions.radius),
                    child: Assets.images.loginImage.image(fit: BoxFit.cover),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocConsumer<LoginCubit, LoginStates>(
                    listenWhen: (context, state) => state.status == LoginStatus.success || state.status == LoginStatus.failure,
                    listener: (context, state){
                      if(state.status == LoginStatus.success){
                        context.go(AppRoutes.home);
                      } else if(state.status == LoginStatus.failure){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.errorMessage ?? 'Failed to login'),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                      }
                    },
                    buildWhen: (context, state) => state.status == LoginStatus.initial
                      || state.status == LoginStatus.loading
                      || state.status == LoginStatus.failure,
                    builder: (context, state) {
                      _cubit = context.read<LoginCubit>();
                      return Center(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: AppDimensions.padding,),
                              Text(AppStrings.loginTitle, style: textTheme.headlineLarge,),
                              SizedBox(height: 8,),
                              Text(AppStrings.loginBody, style: textTheme.bodyLarge,),
                              SizedBox(height: 24,),
                              LoginForm(cubit: _cubit, formKey: _formKey),
                              SizedBox(height: 8,),
                              Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: (){},
                                  child: Text(AppStrings.forgotPassword, style: textTheme.labelLarge?.copyWith(color: AppColors.primary),),
                                ),
                              ),
                              SizedBox(height: 24,),
                              CustomElevatedButton(
                                onPressed: () async => await _cubit.login(),
                                text: AppStrings.signIn,
                                isEnabled: state.status != LoginStatus.loading,
                              ),
                              SizedBox(height: 16,),
                              Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      color: AppColors.borderColor,
                                      thickness: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(AppStrings.continueWith, style: textTheme.bodyLarge,),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      color: AppColors.borderColor,
                                      thickness: 1,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                      onPressed: (){},
                                      child: Center(child: Text(AppStrings.google),),
                                    ),
                                  ),
                                  SizedBox(width: 16,),
                                  Expanded(
                                    child: OutlinedButton(
                                      onPressed: (){},
                                      child: Center(child: Text(AppStrings.apple),),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 32,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(AppStrings.noAccount, style: textTheme.bodyLarge,),
                                  SizedBox(width: 4,),
                                  GestureDetector(
                                    onTap: () => context.push(AppRoutes.signup),
                                    child: Text(AppStrings.signUp, style: textTheme.labelLarge?.copyWith(color: AppColors.primary),),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
