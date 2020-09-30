import 'package:dolphins/carWash/car_wash_action.dart';
import 'package:dolphins/carWash/car_wash_reducer.dart';
import 'package:dolphins/carWash/car_wash_state.dart';
import 'package:dolphins/login/login_action.dart';
import 'package:dolphins/login/login_reducer.dart';
import 'package:dolphins/login/login_state.dart';
import 'package:dolphins/register/register_action.dart';
import 'package:dolphins/register/register_reducer.dart';
import 'package:dolphins/register/register_state.dart';
import 'package:dolphins/setting/carType/carTypeState.dart';
import 'package:dolphins/setting/carType/carType_action.dart';
import 'package:dolphins/setting/carType/car_type_reducer.dart';
import 'package:dolphins/setting/washType/washTypeAction.dart';
import 'package:dolphins/setting/washType/washTypeReducer.dart';
import 'package:dolphins/setting/washType/washTypeState.dart';
import 'package:dolphins/washer/add_washer_action.dart';
import 'package:dolphins/washer/add_washer_reducer.dart';
import 'package:dolphins/washer/add_washer_state.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is SetLoginStateAction) {
    final nextLoginState = loginReducer(state.loginState, action);

    return state.copyWith(loginState: nextLoginState);
  } else if (action is SetRegiterStateAction) {
    final nextRegisterState = registerReducer(state.registerState, action);

    return state.copyWith(registerState: nextRegisterState);
  } else if (action is SetAddWasherStateAction) {
    final nextWasherState = addWasherReducer(state.addWasherState, action);

    return state.copyWith(addWasherState: nextWasherState);
  } else if (action is SetCarTypeStateAction) {
    final nextCarTypeState = carTypeReducer(state.carTypeState, action);

    return state.copyWith(carTypeState: nextCarTypeState);
  } else if (action is SetWashTypeStateAction) {
    final nextCarTypeState = washTypeReducer(state.washTypeState, action);

    return state.copyWith(washTypeState: nextCarTypeState);
  } else if (action is SetCarWashStateAction) {
    final nextCarWashState = carWashReducer(state.carWashState, action);

    return state.copyWith(carWashState: nextCarWashState);
  }

  return state;
}

@immutable
class AppState {
  final RegisterState registerState;
  final LoginState loginState;
  final AddWasherState addWasherState;
  final CarTypeState carTypeState;
  final WashTypeState washTypeState;
  final CarWashState carWashState;
  AppState({
    @required this.registerState,
    @required this.loginState,
    @required this.addWasherState,
    @required this.carTypeState,
    @required this.washTypeState,
    @required this.carWashState,
  });

  AppState copyWith({
    RegisterState registerState,
    LoginState loginState,
    AddWasherState addWasherState,
    CarTypeState carTypeState,
    WashTypeState washTypeState,
    CarWashState carWashState,
  }) {
    return AppState(
      registerState: registerState ?? this.registerState,
      loginState: loginState ?? this.loginState,
      addWasherState: addWasherState ?? this.addWasherState,
      carTypeState: carTypeState ?? this.carTypeState,
      washTypeState: washTypeState ?? this.washTypeState,
      carWashState: carWashState ?? this.carWashState,
    );
  }
}

class Redux {
  static Store<AppState> _store;

  static Store<AppState> get store {
    if (_store == null) {
      throw Exception("store is not initialized");
    } else {
      return _store;
    }
  }

  static Future<void> init() async {
    final registerStateInitial = RegisterState.initial();
    final loginStateInitial = LoginState.initial();
    final addWadherInitial = AddWasherState.initial();
    final carTypeInitial = CarTypeState.initial();
    final washTypeInitial = WashTypeState.initial();
    final carWashInitial = CarWashState.initial();

    _store = Store<AppState>(
      appReducer,
      middleware: [thunkMiddleware],
      initialState: AppState(
          registerState: registerStateInitial,
          loginState: loginStateInitial,
          addWasherState: addWadherInitial,
          carTypeState: carTypeInitial,
          washTypeState: washTypeInitial,
          carWashState: carWashInitial),
    );
  }
}
