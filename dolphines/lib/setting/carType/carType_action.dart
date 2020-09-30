import 'package:dolphins/data_base/db.dart';
import 'package:dolphins/entity/car_type.dart';
import 'package:dolphins/redux/global_store.dart';
import 'package:dolphins/setting/carType/carTypeState.dart';
import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';

@immutable
class SetCarTypeStateAction {
  final CarTypeState registerState;

  SetCarTypeStateAction(this.registerState);
}

class AddCarTypeAction {
  final CarType carType;
  AddCarTypeAction({this.carType}) {
    print(carType);
    createCarType(carType);
  }
  CarType get users => this.carType;

}


Future<void> fetchCarTypeAction(Store<AppState> store) async {
  store.dispatch(SetCarTypeStateAction(CarTypeState(isCarTypeLoading: true)));
  try {
    final database =
          await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final data =database.carTypeDao.findAllCarType();
    store.dispatch(
      SetCarTypeStateAction(
        CarTypeState(
          isCarTypeLoading: false,
          carType: data,
        ),
      ),
    );
  } catch (error) {
    store.dispatch(SetCarTypeStateAction(CarTypeState(isCarTypeLoading: false)));
  }
}



createCarType(CarType carType) async {
final database =
          await $FloorAppDatabase.databaseBuilder('app_database.db').build();
     await database.carTypeDao.insertCarType(carType);
      print('save Washer success');
}