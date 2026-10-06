enum SignupStatus { initial, loading, success, failure }
class SignupStates {
  SignupStatus status;

  SignupStates(this.status);

  SignupStates copyWith({
    required SignupStatus status,
  }) => SignupStates(
    status,
  );
}