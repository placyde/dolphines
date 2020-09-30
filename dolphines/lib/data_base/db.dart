import 'dart:async';
import 'package:dolphins/dao/dao.dart';
import 'package:dolphins/entity/entity.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'db.g.dart'; // the generated code will be there

@Database(
    version: 2,
    entities: [User, CarType, CarWash, CarWasher, WashType, WashOption])
abstract class AppDatabase extends FloorDatabase {
  WashOptionDao get washOptionDao;
  UserDao get userDao;
  CarTypeDao get carTypeDao;
  CarWashDao get carwashDao;
  CarWasherDao get carwasherDao;
  WashTypeDao get washTypeDao;
}
