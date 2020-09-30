import 'package:dolphins/carWash/car_wash_action.dart';
import 'package:dolphins/carWash/car_wash_state.dart';

carWashReducer(CarWashState prevState, SetCarWashStateAction action) {
  final payload = action.carWashState;
  return prevState.copyWith(
    isCarWashError: payload.isCarWashError,
    carWash: payload.carWash,
    isCarWashLoading: payload.isCarWashLoading,
  );
}
