// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appdatabase.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
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

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

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
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
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
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao? _userDaoInstance;

  OrdersDao? _ordersDaoInstance;

  DashBoardDao? _dashBoardDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
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
            'CREATE TABLE IF NOT EXISTS `User` (`id` TEXT, `name` TEXT, `email` TEXT, `mobile` TEXT, `roleId` TEXT, `active` INTEGER, `isSupervisor` INTEGER, `isAssigned` INTEGER, `isAccountSetup` INTEGER, `verified` INTEGER, `role` TEXT, `orderSelfAssignment` INTEGER, `orderReturn` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Data` (`id` TEXT, `referenceNo` TEXT, `orderType` TEXT, `pickupLocation` TEXT, `dropoffLocation` TEXT, `placedTime` TEXT, `status` TEXT, `assignedTime` TEXT, `pickedTime` TEXT, `reachedTime` TEXT, `deliveredTime` TEXT, `cancelledTime` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `DashBoardDetails` (`id` INTEGER, `total` INTEGER, `assigned` INTEGER, `inProgress` INTEGER, `cancelled` INTEGER, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }

  @override
  OrdersDao get ordersDao {
    return _ordersDaoInstance ??= _$OrdersDao(database, changeListener);
  }

  @override
  DashBoardDao get dashBoardDao {
    return _dashBoardDaoInstance ??= _$DashBoardDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'User',
            (User item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'email': item.email,
                  'mobile': item.mobile,
                  'roleId': item.roleId,
                  'active': item.active,
                  'isSupervisor': item.isSupervisor == null
                      ? null
                      : (item.isSupervisor! ? 1 : 0),
                  'isAssigned': item.isAssigned == null
                      ? null
                      : (item.isAssigned! ? 1 : 0),
                  'isAccountSetup': item.isAccountSetup,
                  'verified': item.verified,
                  'role': item.role,
                  'orderSelfAssignment': item.orderSelfAssignment == null
                      ? null
                      : (item.orderSelfAssignment! ? 1 : 0),
                  'orderReturn': item.orderReturn == null
                      ? null
                      : (item.orderReturn! ? 1 : 0)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<User> _userInsertionAdapter;

  @override
  Future<User?> findAllUsers() async {
    return _queryAdapter.query('SELECT * FROM User',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as String?,
            name: row['name'] as String?,
            email: row['email'] as String?,
            mobile: row['mobile'] as String?,
            roleId: row['roleId'] as String?,
            active: row['active'] as int?,
            isSupervisor: row['isSupervisor'] == null
                ? null
                : (row['isSupervisor'] as int) != 0,
            isAssigned: row['isAssigned'] == null
                ? null
                : (row['isAssigned'] as int) != 0,
            isAccountSetup: row['isAccountSetup'] as int?,
            verified: row['verified'] as int?,
            role: row['role'] as String?,
            orderSelfAssignment: row['orderSelfAssignment'] == null
                ? null
                : (row['orderSelfAssignment'] as int) != 0,
            orderReturn: row['orderReturn'] == null
                ? null
                : (row['orderReturn'] as int) != 0));
  }

  @override
  Stream<User?> findById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM User WHERE id = ?1',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as String?,
            name: row['name'] as String?,
            email: row['email'] as String?,
            mobile: row['mobile'] as String?,
            roleId: row['roleId'] as String?,
            active: row['active'] as int?,
            isSupervisor: row['isSupervisor'] == null
                ? null
                : (row['isSupervisor'] as int) != 0,
            isAssigned: row['isAssigned'] == null
                ? null
                : (row['isAssigned'] as int) != 0,
            isAccountSetup: row['isAccountSetup'] as int?,
            verified: row['verified'] as int?,
            role: row['role'] as String?,
            orderSelfAssignment: row['orderSelfAssignment'] == null
                ? null
                : (row['orderSelfAssignment'] as int) != 0,
            orderReturn: row['orderReturn'] == null
                ? null
                : (row['orderReturn'] as int) != 0),
        arguments: [id],
        queryableName: 'User',
        isView: false);
  }

  @override
  Future<void> insertUser(User user) async {
    await _userInsertionAdapter.insert(user, OnConflictStrategy.abort);
  }
}

class _$OrdersDao extends OrdersDao {
  _$OrdersDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _dataInsertionAdapter = InsertionAdapter(
            database,
            'Data',
            (Data item) => <String, Object?>{
                  'id': item.id,
                  'referenceNo': item.referenceNo,
                  'orderType': item.orderType,
                  'pickupLocation': item.pickupLocation,
                  'dropoffLocation': item.dropoffLocation,
                  'placedTime': item.placedTime,
                  'status': item.status,
                  'assignedTime': item.assignedTime,
                  'pickedTime': item.pickedTime,
                  'reachedTime': item.reachedTime,
                  'deliveredTime': item.deliveredTime,
                  'cancelledTime': item.cancelledTime
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Data> _dataInsertionAdapter;

  @override
  Future<List<Data?>> findAllOrders() async {
    return _queryAdapter.queryList('SELECT * FROM User',
        mapper: (Map<String, Object?> row) => Data(
            id: row['id'] as String?,
            referenceNo: row['referenceNo'] as String?,
            orderType: row['orderType'] as String?,
            pickupLocation: row['pickupLocation'] as String?,
            dropoffLocation: row['dropoffLocation'] as String?,
            placedTime: row['placedTime'] as String?,
            status: row['status'] as String?,
            assignedTime: row['assignedTime'] as String?,
            pickedTime: row['pickedTime'] as String?,
            reachedTime: row['reachedTime'] as String?,
            deliveredTime: row['deliveredTime'] as String?,
            cancelledTime: row['cancelledTime'] as String?));
  }

  @override
  Stream<Data?> findById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM User WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Data(
            id: row['id'] as String?,
            referenceNo: row['referenceNo'] as String?,
            orderType: row['orderType'] as String?,
            pickupLocation: row['pickupLocation'] as String?,
            dropoffLocation: row['dropoffLocation'] as String?,
            placedTime: row['placedTime'] as String?,
            status: row['status'] as String?,
            assignedTime: row['assignedTime'] as String?,
            pickedTime: row['pickedTime'] as String?,
            reachedTime: row['reachedTime'] as String?,
            deliveredTime: row['deliveredTime'] as String?,
            cancelledTime: row['cancelledTime'] as String?),
        arguments: [id],
        queryableName: 'Data',
        isView: false);
  }

  @override
  Future<void> insertAllData(List<Data> data) async {
    await _dataInsertionAdapter.insertList(data, OnConflictStrategy.abort);
  }
}

class _$DashBoardDao extends DashBoardDao {
  _$DashBoardDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _dashBoardDetailsInsertionAdapter = InsertionAdapter(
            database,
            'DashBoardDetails',
            (DashBoardDetails item) => <String, Object?>{
                  'id': item.id,
                  'total': item.total,
                  'assigned': item.assigned,
                  'inProgress': item.inProgress,
                  'cancelled': item.cancelled
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<DashBoardDetails> _dashBoardDetailsInsertionAdapter;

  @override
  Future<DashBoardDetails?> findAllData() async {
    return _queryAdapter.query('SELECT * FROM User',
        mapper: (Map<String, Object?> row) => DashBoardDetails(
            total: row['total'] as int?,
            assigned: row['assigned'] as int?,
            inProgress: row['inProgress'] as int?,
            cancelled: row['cancelled'] as int?));
  }

  @override
  Future<void> insertData(DashBoardDetails dashBoardDetails) async {
    await _dashBoardDetailsInsertionAdapter.insert(
        dashBoardDetails, OnConflictStrategy.abort);
  }
}
