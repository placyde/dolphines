import 'package:dolphins/entity/entity.dart';
import 'package:floor/floor.dart';

 @dao
 abstract class UserDao {
   @Query('SELECT * FROM user')
   Future<List<User>> findAllUser();

   @Query('SELECT * FROM user WHERE id = :id')
   Future<User> findUserById(int id);

   @insert
   Future<void> insertUser(User user);

   @Query('UPDATE * FROM user WHERE id = :id')
   Future<void> updateUser(int id);
 }