enum LoginStatus { initial, changeEmail, changePassword, loading, success, failure }
class LoginStates {
  LoginStatus status;

  String email;
  String password;
  String? errorMessage;

  LoginStates(this.status, {
    this.email = '',
    this.password = '',
    this.errorMessage,
  });

  LoginStates copyWith(LoginStatus status,{
    String? email,
    String? password,
    String? errorMessage,
  }) => LoginStates(
    status,
    email: email ?? this.email,
    password: password ?? this.password,
    errorMessage: errorMessage,
  );
}