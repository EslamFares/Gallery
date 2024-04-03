abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class ChangePasswordState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSucessState extends LoginState {}

final class LoginFailureState extends LoginState {
  final String errorMsg;

  LoginFailureState({required this.errorMsg});
}
