import 'package:luckin_coffee_demo/common/global.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
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
  Future<Database> _open(String path) async {
    _reset();
    return await databaseFactory.openDatabase(path,
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
            }));
  }

  Future<bool> isDatabase(String path) async {
    Database db;
    var isDatabase = false;
    try {
      db = await openReadOnlyDatabase(path);
      var version = await db.getVersion();
      if (version != null) {
        isDatabase = true;
      }
    } catch (_) {} finally {
      await db?.close();
    }
    return isDatabase;
  }
  ///判断表是否存在
  Future<bool> isTableExits(String tableName) async {
    var res=await _database.rawQuery("select * from Sqlite_master where type = 'table' and name = '$tableName'");
    return res!=null && res.length >0;
  }
  _onCreateMethod(Database db, int version) async {
    if(version==1)

    await db.execute(
        'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');


    db.execute("""
    CREATE TABLE product_category (
    category_id   INTEGER PRIMARY KEY NOT NULL,
    category_name TEXT    NOT NULL,
    category_sort INT     UNIQUE,
    update_time   TIME    NOT NULL);
    """);
  }

  _onConfigureMethod(Database db) {
    log.d("");
  }

  _onDowngradeMethod(Database db, int oldVersion, int newVersion) {
    log.d("");
  }

  _onUpgradeMethod(Database db, int oldVersion, int newVersion) {
    log.d("");
  }

  _onOpenMethod(Database db) {
    log.d("");
  }
}
