import 'dart:collection';

import 'package:luckin_coffee_demo/data_provider/manager/local/help/provider/base_db_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'provider/product_category_provider.dart';

class DatabaseHelp {

  //TODO https://www.jianshu.com/p/3995ca566d9b
  final Database _database;

  Map<String, BaseDBProvider> _map = HashMap();

  DatabaseHelp(this._database) : assert(_database != null) {
    var _productCategoryProvider= ProductCategoryProvider();
    // _productCategoryProvider.isTableExits=_productCategoryProvider.t
    _map[ProductCategoryProvider.className] = _productCategoryProvider;
  }
}
