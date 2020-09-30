import 'package:dolphins/data_base/db.dart';
import 'package:dolphins/entity/entity.dart';

Future<AppDatabase> database() async {
  return await $FloorAppDatabase.databaseBuilder('app_database.db').build();
}

class CarTypeRepo {
  Future<List<CarType>> readAllCarType() async {
    return database().then((value) {
      return value.carTypeDao.findAllCarType();
    });
  }

  Future<CarType> readOneElemenetOfCarType(int id) {
    return database().then((value) {
      return value.carTypeDao.findCarTypeById(id);
    });
  }

  Future<void> updateCarTypeElementById(int id) {
    return database().then((value) {
      return value.carTypeDao.updateCarType(id);
    });
  }

  Future<void> insertCarType(CarType carType) {
    return database().then((value) {
      value.carTypeDao.insertCarType(carType);
    });
  }

  deleteCarTypeById(int id) {
    return database().then((value) {
      return value.carTypeDao.deleteCarType(id);
    });
  }
}
