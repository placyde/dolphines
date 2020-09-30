import 'package:dolphins/data_base/db.dart';
import 'package:dolphins/entity/entity.dart';

Future<AppDatabase> database() async {
  return await $FloorAppDatabase.databaseBuilder('app_database.db').build();
}

class WashTypeRepo {
  Future<List<WashType>> readAllWashType() =>
      database().then((value) => value.washTypeDao.findAllWashType());

  Future<void> updateWashTypeById(int id) =>
      database().then((value) => value.washTypeDao.updateWashType(id));

  Future<WashType> readWashTypeById(int id) =>
      database().then((value) => value.washTypeDao.findWashTypeById(id));
}
