import 'package:dolphins/entity/entity.dart';
import 'package:floor/floor.dart';

 @dao
 abstract class CarWashDao {
   @Query('SELECT * FROM carWash')
   Future<List<CarWash>> findAllCarWash();

   @Query('SELECT * FROM carWash WHERE id = :id')
   Future<CarWash> findCarWashById(int id);

   @Query('SELECT * FROM carWash WHERE washerid = :washer')
   Future<List<CarWash>> findCarWashByWasher(int washer);

   @insert
   Future<void> insertCarWash(CarWash carWash);

   @Query('UPDATE * FROM carWash WHERE id = :id')
   Future<void> updateCarWash(int id);
 }