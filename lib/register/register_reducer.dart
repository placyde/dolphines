import 'package:dolphins/register/register_action.dart';
import 'package:dolphins/register/register_state.dart';

registerReducer(RegisterState prevState, SetRegiterStateAction action) {
  final payload = action.registerState;
  return prevState.copyWith(
    isRegisterError: payload.isRegisterError,
    user: payload.user,
    isRegisterLoading: payload.isRegisterLoading,
  );
}
