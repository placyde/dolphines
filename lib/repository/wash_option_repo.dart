import 'package:dolphins/data_base/db.dart';
import 'package:dolphins/entity/entity.dart';

Future<AppDatabase> database() async {
  return await $FloorAppDatabase.databaseBuilder('app_database.db').build();
}

class WashOptionRepo {
  Future<List<WashOption>> readWashOptionList(int ida) => database()
      .then((value) => value.washOptionDao.findWashOptionListById(ida));
      
  insertWashOption(WashOption washOption) => database()
      .then((value) => value.washOptionDao.insertWashOption(washOption));
}
