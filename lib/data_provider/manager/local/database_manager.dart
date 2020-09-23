import 'package:luckin_coffee_demo/common/global.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  static final DatabaseManager _instance = DatabaseManager._internal();

  factory DatabaseManager() => _instance;
  String db_path = "";

  Database _database;

  /// true when onConfigure is called.
  bool onConfigureCalled;

  /// true when onOpen is called.
  bool onOpenCalled;

  /// true when onCreate is called.
  bool onCreateCalled;

  /// true when onDowngrade is called.
  bool onDowngradeCalled;

  /// true when onUpgrade is called.
  bool onUpgradeCalled;

  DatabaseManager._internal() {
    if (_database == null)
      getDatabasesPath().then((path) {
        this.db_path = join(path, DATA_BASE_NAME);
        log.d("数据库路径:${this.db_path}");
        return _open(this.db_path);
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
              onCreateCalled = true;
            },
            onConfigure: (Database db) {
              onConfigureCalled = true;
            },
            onDowngrade: (Database db, int oldVersion, int newVersion) {
              onDowngradeCalled = true;
            },
            onUpgrade: (Database db, int oldVersion, int newVersion) {
              onUpgradeCalled = true;
            },
            onOpen: (Database db) {
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
}
