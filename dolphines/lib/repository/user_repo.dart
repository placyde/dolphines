import 'package:dolphins/data_base/db.dart';
import 'package:dolphins/entity/entity.dart';

Future<AppDatabase> database() async {
  return await $FloorAppDatabase.databaseBuilder('app_database.db').build();
}

class UserRepo {
  Future<void> insertUser(User user) =>
      database().then((value) => value.userDao.insertUser(user));

  Future<List<User>> readAllUser() =>
      database().then((value) => value.userDao.findAllUser());

  Future<User> readOneUserById(int id) =>
      database().then((value) => value.userDao.findUserById(id));
      
  Future<void> updateUserById(int id) =>
      database().then((value) => value.userDao.updateUser(id));
}
