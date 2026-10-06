import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/auth/data/repository/auth_repository.dart';

import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates>{
  AuthRepository _repository;

  LoginCubit(this._repository) : super(LoginStates(LoginStatus.initial));

}