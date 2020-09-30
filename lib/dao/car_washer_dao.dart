
import 'package:dolphins/entity/entity.dart';
import 'package:floor/floor.dart';

 @dao
 abstract class CarWasherDao {
   @Query('SELECT * FROM carWasher')
   Future<List<CarWasher>> findAllCarWasher();

   @Query('SELECT * FROM carWasher WHERE id = :id')
   Future<CarWasher> findCarWasherById(int id);

   @insert
   Future<void> insertCarWasher(CarWasher carWasher);

   @Query('UPDATE * FROM carWasher WHERE id = :id')
   Future<void> updateCarWasher(int id);

   @Query('DELETE FROM carWasher WHERE id = :id')
   Future<void> deleteCarWasher(int id);
 }