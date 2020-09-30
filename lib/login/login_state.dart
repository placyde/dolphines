import 'package:meta/meta.dart';


@immutable
class LoginState {
  final bool isLoginError;
  final bool isLoginSuccess;
  final bool isLoginLoading;
  LoginState({
    this.isLoginError,
    this.isLoginSuccess,
    this.isLoginLoading
  });

  factory LoginState.initial() => LoginState(
        isLoginLoading: false,
        isLoginError: false,
        isLoginSuccess: false,
      );

  LoginState copyWith({
    @required bool isLoginLoading,
    @required bool isLoginError,
    @required bool isLoginSuccess,
  }) {
    return LoginState(
      isLoginLoading: isLoginLoading ?? this.isLoginLoading,
      isLoginError: isLoginError ?? this.isLoginError,
      isLoginSuccess: isLoginSuccess ?? this.isLoginSuccess,
    );
  }
}
