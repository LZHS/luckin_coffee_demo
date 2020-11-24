import 'package:luckin_coffee_demo/data_provider/manager/beans/product_category.dart';
import 'package:luckin_coffee_demo/data_provider/manager/local/help/provider/base_db_provider.dart';
import 'package:sqflite/sqflite.dart';

class ProductCategoryProvider extends BaseDBProvider {
  static final className = "ProductCategoryProvider";
  final tabName = "product_category",
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

  Future<List<ProductCategory>> findAll() {
    if (_database.isOpen)
      return _database.rawQuery(
        """ SELECT * FROM product_category ORDER BY category_sort;""",
      ).then((data) {
        List<ProductCategory> list;
        data.forEach((element) {
          list.add(ProductCategory.fromJson(element));
        });
        return list;
      });
    return Future.error("");
  }


  Future<int> findMaxUpdateTime() {
    return Future(()=>1);
  }
}
