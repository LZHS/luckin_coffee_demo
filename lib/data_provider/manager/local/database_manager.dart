import 'dart:collection';

import 'package:luckin_coffee_demo/common/global.dart';
import 'package:luckin_coffee_demo/data_provider/manager/local/help/provider/product_category_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'help/provider/base_db_provider.dart';

class DatabaseManager {
  Map<String, BaseDBProvider> _providerMap = HashMap();

  static final DatabaseManager _instance = DatabaseManager._internal();

  factory DatabaseManager() => _instance;
  String dbPath = "";

  Database _database;

  bool onConfigureCalled,
      onOpenCalled,
      onCreateCalled,
      onDowngradeCalled,
      onUpgradeCalled;

  DatabaseManager._internal() {
    if (_database == null)
      getDatabasesPath().then((path) {
        this.dbPath = join(path, DATA_BASE_NAME);
        return _open(this.dbPath);
      }).then((database) => this._database = database);
  }

  void _reset() {
    onConfigureCalled = false;
    onOpenCalled = false;
    onCreateCalled = false;
    onDowngradeCalled = false;
    onUpgradeCalled = false;
  }

  /// 打开一个 数据库
  Future<Database> _open(String path) {
    _reset();
    return  databaseFactory.openDatabase(
            path,
            options: OpenDatabaseOptions(
              version: DATA_BASE_CURRENT_VERSION,
              onCreate: (Database db, int version) {
                _onCreateMethod(db, version);
                onCreateCalled = true;
              },
              onConfigure: (Database db) {
                _onConfigureMethod(db);
                onConfigureCalled = true;
              },
              onDowngrade: (Database db, int oldVersion, int newVersion) {
                _onDowngradeMethod(db, oldVersion, newVersion);
                onDowngradeCalled = true;
              },
              onUpgrade: (Database db, int oldVersion, int newVersion) {
                _onUpgradeMethod(db, oldVersion, newVersion);
                onUpgradeCalled = true;
              },
              onOpen: (Database db) {
                _onOpenMethod(db);
                onOpenCalled = true;
              },
            ),
          );
  }

  Future<bool> _isDatabase(String path) async {
    Database db;
    var isDatabase = false;
    try {
      db = await openReadOnlyDatabase(path);
      var version = await db.getVersion();
      log.d("当前数据库版本 ：$version");
      if (version != null) {
        isDatabase = true;
      }
    } catch (_) {} finally {
      await db?.close();
    }
    return isDatabase;
  }

  ///判断表是否存在
  Future<bool> isTableExits(String tableName) {
    return _database
        .rawQuery(
        "select * from Sqlite_master where type = 'table' and name = '$tableName'")
        .then((data) => Future.value(data != null && data.length > 0));
  }

  _onCreateMethod(Database db, int version) async {}

  _onConfigureMethod(Database db) {}

  _onDowngradeMethod(Database db, int oldVersion, int newVersion) {
    log.d("");
  }

  _onUpgradeMethod(Database db, int oldVersion, int newVersion) {
    log.d("");
  }

  _onOpenMethod(Database db) {
    log.d("每次打开数据时");
    _providerMap.clear();
    createProductCategoryPro(db);
  }
/// 創建并保存一个 产品类目 表 信息
  void createProductCategoryPro(Database db) {
    _database = db;
    isTableExits(ProductCategoryProvider.tabName).then((isExits) {
      BaseDBProvider dbProvider = ProductCategoryProvider(db);
      _providerMap[ProductCategoryProvider.className] = dbProvider;
      if (!isExits) {
        db.execute(dbProvider.createTableString()).then((value) =>
        dbProvider.isTableExits = true);
      }
    });
  }

  Future<BaseDBProvider> getProvider(String providerName) {
    if (_providerMap.containsKey(providerName))
      return Future<BaseDBProvider>.value(_providerMap[providerName]);
    return Future.error("没有找到 与 $providerName 对应的数据提供器");
  }
}
