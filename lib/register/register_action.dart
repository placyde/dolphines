import 'package:dolphins/data_base/db.dart';
import 'package:dolphins/entity/entity.dart';

import 'package:dolphins/register/register_state.dart';

import 'package:meta/meta.dart';

@immutable
class SetRegiterStateAction {
  final RegisterState registerState;

  SetRegiterStateAction(this.registerState);
}
// Future<void> createUserAction(Store<AppState> store,) async {
//   store.dispatch(SetRegiterStateAction(RegisterState(isRegisterLoading: true)));

// }
class AddItemAction {
  final User user;
  AddItemAction({this.user}) {
    print(user.name);
    createUser(user);
  }
  User get users => this.user;

}

createUser(User user) async {
final database =
          await $FloorAppDatabase.databaseBuilder('app_database.db').build();
      final _userdao = database.userDao;
      await _userdao.insertUser(user);
      print('save user success');
}