import 'package:dolphins/carWash/car_wash_state.dart';
import 'package:dolphins/data_base/db.dart';
import 'package:dolphins/entity/car_wash.dart';
import 'package:dolphins/redux/global_store.dart';
import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';

@immutable
class SetCarWashStateAction {
  final CarWashState carWashState;

  SetCarWashStateAction(this.carWashState);
}


class AddCarWashAction {
  final CarWash carWash;
  AddCarWashAction({this.carWash}) {
    print(carWash);
    createCarWash(carWash);
  }
  CarWash get users => this.carWash;

}


Future<void> fetchCarWashAction(Store<AppState> store) async {
  store.dispatch(SetCarWashStateAction(CarWashState(isCarWashLoading: true)));
  try {
    final database =
          await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final data =database.carwashDao.findAllCarWash();
    store.dispatch(
      SetCarWashStateAction(
        CarWashState(
          isCarWashLoading: false,
          carWash: data,
        ),
      ),
    );
  } catch (error) {
    store.dispatch(SetCarWashStateAction(CarWashState(isCarWashLoading: false)));
  }
}


createCarWash(CarWash carWash) async {
final database =
          await $FloorAppDatabase.databaseBuilder('app_database.db').build();
     await database.carwashDao.insertCarWash(carWash);
      print('save Car Wash success');
}