
import 'package:dolphins/entity/entity.dart';
import 'package:floor/floor.dart';

 @dao
 abstract class WashOptionDao {
   @Query('SELECT * FROM washOption')
   Future<List<WashOption>> findAllWashOption();

   @Query('SELECT * FROM washOption WHERE id = :id')
   Future<WashOption> findWashOptionById(int id);

   @insert
   Future<void> insertWashOption(WashOption washOption);

   @Query('SELECT * FROM washOption WHERE carwash_id = :ida')
   Future<List<WashOption>> findWashOptionListById(int ida);
 }