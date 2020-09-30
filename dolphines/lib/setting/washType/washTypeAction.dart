import 'package:dolphins/data_base/db.dart';
import 'package:dolphins/entity/entity.dart';
import 'package:dolphins/redux/global_store.dart';
import 'package:dolphins/setting/washType/washTypeState.dart';
import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';

@immutable
class SetWashTypeStateAction {
  final WashTypeState washTypeState;

  SetWashTypeStateAction(this.washTypeState);
}

class AddWashTypeAction {
  final WashType washType;
  AddWashTypeAction({this.washType}) {
    print(washType);
    createWashType(washType);
  }
  WashType get users => this.washType;

}


Future<void> fetchWashTypeAction(Store<AppState> store) async {
  store.dispatch(SetWashTypeStateAction(WashTypeState(isWashTypeLoading: true)));
  try {
    final database =
          await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final data =database.washTypeDao.findAllWashType();
    store.dispatch(
      SetWashTypeStateAction(
        WashTypeState(
          isWashTypeLoading: false,
          washType: data,
        ),
      ),
    );
  } catch (error) {
    store.dispatch(SetWashTypeStateAction(WashTypeState(isWashTypeLoading: false)));
  }
}



createWashType(WashType washType) async {
final database =
          await $FloorAppDatabase.databaseBuilder('app_database.db').build();
     await database.washTypeDao.insertWashType(washType);
      print('save Washer success');
}