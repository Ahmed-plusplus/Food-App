import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/auth/data/repository/auth_repository.dart';

import 'signup_states.dart';

class SignupCubit extends Cubit<SignupStates>{
  AuthRepository _repository;

  SignupCubit(this._repository) : super(SignupStates(SignupStatus.initial));

}