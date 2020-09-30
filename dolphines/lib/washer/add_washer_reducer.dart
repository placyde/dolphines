import 'package:dolphins/washer/add_washer_action.dart';
import 'package:dolphins/washer/add_washer_state.dart';

addWasherReducer(AddWasherState prevState, SetAddWasherStateAction action) {
  final payload = action.registerState;
  return prevState.copyWith(
    isRegisterError: payload.isRegisterError,
    carWasher: payload.carWasher,
    isRegisterLoading: payload.isRegisterLoading,
  );
}
