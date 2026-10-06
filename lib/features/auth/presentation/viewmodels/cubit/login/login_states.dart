enum LoginStatus { initial, loading, success, failure }
class LoginStates {
  LoginStatus status;

  LoginStates(this.status);

  LoginStates copyWith({
    required LoginStatus status,
  }) => LoginStates(
    status,
  );
}