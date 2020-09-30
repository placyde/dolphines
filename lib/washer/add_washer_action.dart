
import 'package:dolphins/data_base/db.dart';
import 'package:dolphins/entity/entity.dart';
import 'package:dolphins/redux/global_store.dart';
import 'package:dolphins/washer/add_washer_state.dart';
import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';

@immutable
class SetAddWasherStateAction {
  final AddWasherState registerState;

  SetAddWasherStateAction(this.registerState);
}
// Future<void> createUserAction(Store<AppState> store,) async {
//   store.dispatch(SetRegiterStateAction(RegisterState(isRegisterLoading: true)));

// }
class AddWasherAction {
  final CarWasher washer;
  AddWasherAction({this.washer}) {
    print(washer);
    createUser(washer);
  }
  CarWasher get users => this.washer;

}

Future<void> fetchCarWasherAction(Store<AppState> store) async {
  store.dispatch(SetAddWasherStateAction(AddWasherState(isRegisterLoading: true)));
  try {
    final database =
          await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final data =database.carwasherDao.findAllCarWasher();
    store.dispatch(
      SetAddWasherStateAction(
        AddWasherState(
          isRegisterLoading: false,
          carWasher: data,
        ),
      ),
    );
  } catch (error) {
    store.dispatch(SetAddWasherStateAction(AddWasherState(isRegisterLoading: false)));
  }
}

createUser(CarWasher carWasher) async {
final database =
          await $FloorAppDatabase.databaseBuilder('app_database.db').build();
     await database.carwasherDao.insertCarWasher(carWasher);
      print('save Washer success');
}