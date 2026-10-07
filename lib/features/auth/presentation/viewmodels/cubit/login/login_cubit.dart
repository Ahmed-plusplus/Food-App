import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/auth/data/repository/auth_repository.dart';

import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates>{
  AuthRepository _repository;

  LoginCubit(this._repository) : super(LoginStates(LoginStatus.initial));

  void changeEmail(String email) {
    emit(state.copyWith(LoginStatus.changeEmail, email: email));
  }

  void changePassword(String password) {
    emit(state.copyWith(LoginStatus.changePassword, password: password));
  }

  Future<void> login() async {
    emit(state.copyWith(LoginStatus.loading));
    final response = await _repository.login(state.email, state.password);
    response.fold(
        (error) => emit(state.copyWith(LoginStatus.failure, errorMessage: error.errMessage)),
        (success) => emit(state.copyWith(LoginStatus.success)));
  }

}