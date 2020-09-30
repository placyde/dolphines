// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  WashOptionDao _washOptionDaoInstance;

  UserDao _userDaoInstance;

  CarTypeDao _carTypeDaoInstance;

  CarWashDao _carwashDaoInstance;

  CarWasherDao _carwasherDaoInstance;

  WashTypeDao _washTypeDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 2,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `user` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT, `password` TEXT, `userType` TEXT, `phoneNumber` TEXT, `email` TEXT, `create_time` TEXT NOT NULL, `update_time` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `carType` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `typeName` TEXT, `create_time` TEXT NOT NULL, `update_time` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `carWash` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `matricule` TEXT, `washPrice` TEXT, `owner_id` INTEGER, `cartypeownerId` INTEGER, `washerid` INTEGER, `create_time` TEXT NOT NULL, `update_time` TEXT, FOREIGN KEY (`owner_id`) REFERENCES `carWash` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`cartypeownerId`) REFERENCES `carType` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `carWasher` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `fisrtName` TEXT, `lastName` TEXT, `matricule` TEXT, `alias` TEXT, `cniNumber` TEXT, `phone` TEXT, `picture` TEXT, `create_time` TEXT NOT NULL, `update_time` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `washType` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `washName` TEXT, `washPrice` TEXT, `create_time` TEXT NOT NULL, `update_time` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `washOption` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `washOptionName` TEXT, `owner_id` INTEGER, `carwash_id` INTEGER, FOREIGN KEY (`owner_id`) REFERENCES `carWasher` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`carwash_id`) REFERENCES `washType` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  WashOptionDao get washOptionDao {
    return _washOptionDaoInstance ??= _$WashOptionDao(database, changeListener);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }

  @override
  CarTypeDao get carTypeDao {
    return _carTypeDaoInstance ??= _$CarTypeDao(database, changeListener);
  }

  @override
  CarWashDao get carwashDao {
    return _carwashDaoInstance ??= _$CarWashDao(database, changeListener);
  }

  @override
  CarWasherDao get carwasherDao {
    return _carwasherDaoInstance ??= _$CarWasherDao(database, changeListener);
  }

  @override
  WashTypeDao get washTypeDao {
    return _washTypeDaoInstance ??= _$WashTypeDao(database, changeListener);
  }
}

class _$WashOptionDao extends WashOptionDao {
  _$WashOptionDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _washOptionInsertionAdapter = InsertionAdapter(
            database,
            'washOption',
            (WashOption item) => <String, dynamic>{
                  'id': item.id,
                  'washOptionName': item.washOptionName,
                  'owner_id': item.ownerId,
                  'carwash_id': item.carwashId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _washOptionMapper = (Map<String, dynamic> row) => WashOption(
      id: row['id'] as int,
      washOptionName: row['washOptionName'] as String,
      ownerId: row['owner_id'] as int,
      carwashId: row['carwash_id'] as int);

  final InsertionAdapter<WashOption> _washOptionInsertionAdapter;

  @override
  Future<List<WashOption>> findAllWashOption() async {
    return _queryAdapter.queryList('SELECT * FROM washOption',
        mapper: _washOptionMapper);
  }

  @override
  Future<WashOption> findWashOptionById(int id) async {
    return _queryAdapter.query('SELECT * FROM washOption WHERE id = ?',
        arguments: <dynamic>[id], mapper: _washOptionMapper);
  }

  @override
  Future<List<WashOption>> findWashOptionListById(int ida) async {
    return _queryAdapter.queryList(
        'SELECT * FROM washOption WHERE carwash_id = ?',
        arguments: <dynamic>[ida],
        mapper: _washOptionMapper);
  }

  @override
  Future<void> insertWashOption(WashOption washOption) async {
    await _washOptionInsertionAdapter.insert(
        washOption, OnConflictStrategy.abort);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'user',
            (User item) => <String, dynamic>{
                  'id': item.id,
                  'name': item.name,
                  'password': item.password,
                  'userType': item.userType,
                  'phoneNumber': item.phoneNumber,
                  'email': item.email,
                  'create_time': item.createTime,
                  'update_time': item.updateTime
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _userMapper = (Map<String, dynamic> row) => User(
      id: row['id'] as int,
      name: row['name'] as String,
      password: row['password'] as String,
      userType: row['userType'] as String,
      phoneNumber: row['phoneNumber'] as String,
      email: row['email'] as String,
      createTime: row['create_time'] as String,
      updateTime: row['update_time'] as String);

  final InsertionAdapter<User> _userInsertionAdapter;

  @override
  Future<List<User>> findAllUser() async {
    return _queryAdapter.queryList('SELECT * FROM user', mapper: _userMapper);
  }

  @override
  Future<User> findUserById(int id) async {
    return _queryAdapter.query('SELECT * FROM user WHERE id = ?',
        arguments: <dynamic>[id], mapper: _userMapper);
  }

  @override
  Future<void> updateUser(int id) async {
    await _queryAdapter.queryNoReturn('UPDATE * FROM user WHERE id = ?',
        arguments: <dynamic>[id]);
  }

  @override
  Future<void> insertUser(User user) async {
    await _userInsertionAdapter.insert(user, OnConflictStrategy.abort);
  }
}

class _$CarTypeDao extends CarTypeDao {
  _$CarTypeDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _carTypeInsertionAdapter = InsertionAdapter(
            database,
            'carType',
            (CarType item) => <String, dynamic>{
                  'id': item.id,
                  'typeName': item.typeName,
                  'create_time': item.createTime,
                  'update_time': item.updateTime
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _carTypeMapper = (Map<String, dynamic> row) => CarType(
      id: row['id'] as int,
      typeName: row['typeName'] as String,
      createTime: row['create_time'] as String,
      updateTime: row['update_time'] as String);

  final InsertionAdapter<CarType> _carTypeInsertionAdapter;

  @override
  Future<List<CarType>> findAllCarType() async {
    return _queryAdapter.queryList('SELECT * FROM carType',
        mapper: _carTypeMapper);
  }

  @override
  Future<CarType> findCarTypeById(int id) async {
    return _queryAdapter.query('SELECT * FROM carType WHERE id = ?',
        arguments: <dynamic>[id], mapper: _carTypeMapper);
  }

  @override
  Future<void> updateCarType(int id) async {
    await _queryAdapter.queryNoReturn('UPDATE * FROM carType WHERE id = ?',
        arguments: <dynamic>[id]);
  }

  @override
  Future<void> deleteCarType(int id) async {
    await _queryAdapter.queryNoReturn('DELETE * FROM carType WHERE id = ?',
        arguments: <dynamic>[id]);
  }

  @override
  Future<void> insertCarType(CarType carType) async {
    await _carTypeInsertionAdapter.insert(carType, OnConflictStrategy.abort);
  }
}

class _$CarWashDao extends CarWashDao {
  _$CarWashDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _carWashInsertionAdapter = InsertionAdapter(
            database,
            'carWash',
            (CarWash item) => <String, dynamic>{
                  'id': item.id,
                  'matricule': item.matricule,
                  'washPrice': item.washPrice,
                  'owner_id': item.ownerId,
                  'cartypeownerId': item.cartypeownerId,
                  'washerid': item.washer,
                  'create_time': item.createTime,
                  'update_time': item.updateTime
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _carWashMapper = (Map<String, dynamic> row) => CarWash(
      id: row['id'] as int,
      matricule: row['matricule'] as String,
      washPrice: row['washPrice'] as String,
      ownerId: row['owner_id'] as int,
      cartypeownerId: row['cartypeownerId'] as int,
      washer: row['washerid'] as int,
      createTime: row['create_time'] as String,
      updateTime: row['update_time'] as String);

  final InsertionAdapter<CarWash> _carWashInsertionAdapter;

  @override
  Future<List<CarWash>> findAllCarWash() async {
    return _queryAdapter.queryList('SELECT * FROM carWash',
        mapper: _carWashMapper);
  }

  @override
  Future<CarWash> findCarWashById(int id) async {
    return _queryAdapter.query('SELECT * FROM carWash WHERE id = ?',
        arguments: <dynamic>[id], mapper: _carWashMapper);
  }

  @override
  Future<List<CarWash>> findCarWashByWasher(int washer) async {
    return _queryAdapter.queryList('SELECT * FROM carWash WHERE washerid = ?',
        arguments: <dynamic>[washer], mapper: _carWashMapper);
  }

  @override
  Future<void> updateCarWash(int id) async {
    await _queryAdapter.queryNoReturn('UPDATE * FROM carWash WHERE id = ?',
        arguments: <dynamic>[id]);
  }

  @override
  Future<void> insertCarWash(CarWash carWash) async {
    await _carWashInsertionAdapter.insert(carWash, OnConflictStrategy.abort);
  }
}

class _$CarWasherDao extends CarWasherDao {
  _$CarWasherDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _carWasherInsertionAdapter = InsertionAdapter(
            database,
            'carWasher',
            (CarWasher item) => <String, dynamic>{
                  'id': item.id,
                  'fisrtName': item.fisrtName,
                  'lastName': item.lastName,
                  'matricule': item.matricule,
                  'alias': item.alias,
                  'cniNumber': item.cniNumber,
                  'phone': item.phone,
                  'picture': item.picture,
                  'create_time': item.createTime,
                  'update_time': item.updateTime
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _carWasherMapper = (Map<String, dynamic> row) => CarWasher(
      id: row['id'] as int,
      fisrtName: row['fisrtName'] as String,
      lastName: row['lastName'] as String,
      matricule: row['matricule'] as String,
      alias: row['alias'] as String,
      cniNumber: row['cniNumber'] as String,
      phone: row['phone'] as String,
      picture: row['picture'] as String,
      createTime: row['create_time'] as String,
      updateTime: row['update_time'] as String);

  final InsertionAdapter<CarWasher> _carWasherInsertionAdapter;

  @override
  Future<List<CarWasher>> findAllCarWasher() async {
    return _queryAdapter.queryList('SELECT * FROM carWasher',
        mapper: _carWasherMapper);
  }

  @override
  Future<CarWasher> findCarWasherById(int id) async {
    return _queryAdapter.query('SELECT * FROM carWasher WHERE id = ?',
        arguments: <dynamic>[id], mapper: _carWasherMapper);
  }

  @override
  Future<void> updateCarWasher(int id) async {
    await _queryAdapter.queryNoReturn('UPDATE * FROM carWasher WHERE id = ?',
        arguments: <dynamic>[id]);
  }

  @override
  Future<void> deleteCarWasher(int id) async {
    await _queryAdapter.queryNoReturn('DELETE FROM carWasher WHERE id = ?',
        arguments: <dynamic>[id]);
  }

  @override
  Future<void> insertCarWasher(CarWasher carWasher) async {
    await _carWasherInsertionAdapter.insert(
        carWasher, OnConflictStrategy.abort);
  }
}

class _$WashTypeDao extends WashTypeDao {
  _$WashTypeDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _washTypeInsertionAdapter = InsertionAdapter(
            database,
            'washType',
            (WashType item) => <String, dynamic>{
                  'id': item.id,
                  'washName': item.washName,
                  'washPrice': item.washPrice,
                  'create_time': item.createTime,
                  'update_time': item.updateTime
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _washTypeMapper = (Map<String, dynamic> row) => WashType(
      id: row['id'] as int,
      washName: row['washName'] as String,
      washPrice: row['washPrice'] as String,
      createTime: row['create_time'] as String,
      updateTime: row['update_time'] as String);

  final InsertionAdapter<WashType> _washTypeInsertionAdapter;

  @override
  Future<List<WashType>> findAllWashType() async {
    return _queryAdapter.queryList('SELECT * FROM washType',
        mapper: _washTypeMapper);
  }

  @override
  Future<WashType> findWashTypeById(int id) async {
    return _queryAdapter.query('SELECT * FROM washType WHERE id = ?',
        arguments: <dynamic>[id], mapper: _washTypeMapper);
  }

  @override
  Future<void> updateWashType(int id) async {
    await _queryAdapter.queryNoReturn('UPDATE * FROM washType WHERE id = ?',
        arguments: <dynamic>[id]);
  }

  @override
  Future<void> insertWashType(WashType washType) async {
    await _washTypeInsertionAdapter.insert(washType, OnConflictStrategy.abort);
  }
}
