
import 'dart:async';

import 'package:dolphins/entity/entity.dart';
import 'package:dolphins/login/login_state.dart';
import 'package:dolphins/redux/global_store.dart';
import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';

@immutable
class SetLoginStateAction {
  final LoginState loginState;

  SetLoginStateAction(this.loginState);
}

// ignore: missing_return
Future<User> loginAction(Store<AppState> store) async {
  store.dispatch(SetLoginStateAction(LoginState(isLoginLoading: true)));

 Timer(Duration(seconds: 5), () {
  print("Yeah, this line is printed after 3 seconds");
  store.dispatch(SetLoginStateAction(LoginState(isLoginLoading: false)));
  store.dispatch(SetLoginStateAction(LoginState(isLoginSuccess: true)));
});
 
 

}

Future<void> logoutAction(Store<AppState> store) async {
  store.dispatch(SetLoginStateAction(LoginState(isLoginLoading: true)));

}

