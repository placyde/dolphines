
import 'package:dolphins/entity/entity.dart';
import 'package:floor/floor.dart';

 @dao
 abstract class CarTypeDao {
   @Query('SELECT * FROM carType')
   Future<List<CarType>> findAllCarType();

   @Query('SELECT * FROM carType WHERE id = :id')
   Future<CarType> findCarTypeById(int id);

   @insert
   Future<void> insertCarType(CarType carType);

   @Query('UPDATE * FROM carType WHERE id = :id')
   Future<void> updateCarType(int id);

   @Query('DELETE * FROM carType WHERE id = :id')
   Future<void> deleteCarType(int id);
 }