import 'package:luckin_coffee_demo/data_provider/manager/beans/product_category.dart';
import 'package:luckin_coffee_demo/data_provider/manager/local/help/provider/base_db_provider.dart';
import 'package:sqflite/sqflite.dart';

class ProductCategoryProvider extends BaseDBProvider {
  static final className = "ProductCategoryProvider";
  final tabName = "product_category",
      category_id = "category_id",
      category_name = "category_name",
      category_sort = "category_sort",
      update_time = "update_time";

  final Database _database;

  ProductCategoryProvider(this._database) : assert(_database != null);
 
  @override
  createTableString() => """
    CREATE TABLE $tabName (
    $category_id   INTEGER PRIMARY KEY NOT NULL,
    $category_name TEXT    NOT NULL,
    $category_sort INT     UNIQUE,
   $update_time   TIME    NOT NULL);
    """;
  @override
  String tableName()=> tabName;
  
  Future<List<ProductCategory>> findAll(){
    if(_database.isOpen)
      _database.query("table");
  }
}
