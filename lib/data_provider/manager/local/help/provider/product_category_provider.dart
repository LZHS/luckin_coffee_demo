import 'package:luckin_coffee_demo/data_provider/manager/local/help/provider/base_db_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../data_provider.dart';

class ProductCategoryProvider extends BaseDBProvider {
  static final className = "ProductCategoryProvider";
  static final tabName = "product_category",
      categoryId = "category_id",
      categoryName = "category_name",
      categorySort = "category_sort",
      updateTime = "update_time";

  final Database _database;

  ProductCategoryProvider(this._database) : assert(_database != null);

  @override
  createTableString() => """
    CREATE TABLE $tabName (
    $categoryId   INTEGER PRIMARY KEY NOT NULL,
    $categoryName TEXT    NOT NULL,
    $categorySort INT     UNIQUE,
    $updateTime   INT    NOT NULL);
    """;

  @override
  String tableName() => tabName;

  Future<BaseEntity> findAll() {
    if (_database.isOpen)
      return _database
          .rawQuery(
        "SELECT * FROM $tabName ORDER BY $categorySort;",
      )
          .then((data) {
        List<ProductCategory> list;
        data.forEach((element) {
          list.add(ProductCategory.fromJson(element));
        });
        return list;
      }).then((value) => BaseEntity(code: 0, message: "", result: value));
    return Future.error(BaseEntity(code: -1, message: "数据库异常", result: null));
  }

  /// 找到最新更新的数据
  Future<BaseEntity<int>> findMaxUpdateTime() {
    if (_database.isOpen)
      _database
          .rawQuery(
              "SELECT $updateTime  FROM $tabName WHERE $updateTime = ( SELECT MAX($updateTime) FROM $tabName );")
          .then((data) {
        if (data.length <= 0)
          return Future.error(
              BaseEntity(code: -1, message: "数据库异常", result: data[0]));
        return Future.value(BaseEntity(code: 0, message: "", result: null));
      });
    return Future.error(BaseEntity(code: -1, message: "数据库异常", result: null));
  }
}
