import 'package:dolphins/data_base/db.dart';
import 'package:dolphins/entity/entity.dart';

Future<AppDatabase> database() async {
  return await $FloorAppDatabase.databaseBuilder('app_database.db').build();
}

class CarWashRepo {

Future<List<CarWash>> readAllCarWash() async{
  return database().then((value) => value.carwashDao.findAllCarWash());
}

Future<CarWash> readOneElementOfCarWash(int id){
  return database().then((value) => value.carwashDao.findCarWashById(id));
}

Future<void> updataCarWashById(int id){
  return database().then((value) => value.carwashDao.updateCarWash(id));
}

Future<void> insertCarWash(CarWash carWash){
  return database().then((value) => value.carwashDao.insertCarWash(carWash));
}

Future<List<CarWash>> readCarWashByWasher(int idwasher){
  return database().then((value) => value.carwashDao.findCarWashByWasher(idwasher));
}

}