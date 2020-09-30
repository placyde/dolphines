import 'package:dolphins/login/login_action.dart';
import 'package:dolphins/login/login_state.dart';

loginReducer(LoginState prevState, SetLoginStateAction action) {
  final payload = action.loginState;
  return prevState.copyWith(
    isLoginError: payload.isLoginError,
    isLoginSuccess: payload.isLoginSuccess,
    isLoginLoading: payload.isLoginLoading,
  );
}
