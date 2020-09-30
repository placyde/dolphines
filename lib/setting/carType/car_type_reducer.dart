import 'package:dolphins/setting/carType/carTypeState.dart';
import 'package:dolphins/setting/carType/carType_action.dart';

carTypeReducer(CarTypeState prevState, SetCarTypeStateAction action) {
  final payload = action.registerState;
  return prevState.copyWith(
    isRegisterError: payload.isCarTypeError,
    carType: payload.carType,
    isRegisterLoading: payload.isCarTypeLoading,
  );
}
