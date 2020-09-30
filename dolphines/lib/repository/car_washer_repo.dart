import 'package:dolphins/data_base/db.dart';
import 'package:dolphins/entity/entity.dart';

Future<AppDatabase> database() async {
  return await $FloorAppDatabase.databaseBuilder('app_database.db').build();
}

class CarWasherRepo {
  Future<List<CarWasher>> readAllCarWasher() =>
      database().then((value) => value.carwasherDao.findAllCarWasher());

  Future<CarWasher> readOneElementOfCarWasherById(int id) =>
      database().then((value) => value.carwasherDao.findCarWasherById(id));

  Future<void> insertCarWasher(CarWasher carWasher) =>
      database().then((value) => value.carwasherDao.insertCarWasher(carWasher));

  Future<void> updateCarWasherById(int id) =>
      database().then((value) => value.carwasherDao.updateCarWasher(id));

  Future<void> deleteCarWasherById(int id) =>
      database().then((value) => value.carwasherDao.deleteCarWasher(id));
}
