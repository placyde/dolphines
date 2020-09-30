import 'package:dolphins/entity/entity.dart';
import 'package:floor/floor.dart';

 @dao
 abstract class WashTypeDao {
   @Query('SELECT * FROM washType')
   Future<List<WashType>> findAllWashType();

   @Query('SELECT * FROM washType WHERE id = :id')
   Future<WashType> findWashTypeById(int id);

   @insert
   Future<void> insertWashType(WashType washType);


    @Query('UPDATE * FROM washType WHERE id = :id')
   Future<void> updateWashType(int id);
 }