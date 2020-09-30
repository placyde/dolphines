import 'package:dolphins/setting/washType/washTypeAction.dart';
import 'package:dolphins/setting/washType/washTypeState.dart';

washTypeReducer(WashTypeState prevState, SetWashTypeStateAction action) {
  final payload = action.washTypeState;
  return prevState.copyWith(
    isWashTypeError: payload.isWashTypeError,
    washType: payload.washType,
    isWashTypeLoading: payload.isWashTypeLoading,
  );
}