import 'package:luckin_coffee_demo/data_provider/beans/banner/banner_bean.dart';
import 'package:luckin_coffee_demo/data_provider/manager/local/help/provider/base_db_provider.dart';
import 'package:sqflite/sqlite_api.dart';

class BannerProvider extends BaseDBProvider {
  static final className = "BannerProvider";

  //{"id":"1603953176025225666","imgPath":"images/banners/icon_banner01.webp","action":0,"bannerId":1,"updateTime":1607013065000}
  static final tabName = "banner",
      id = "id",
      imgPath = "img_path",
      action = "action",
      bannerId = "banner_id",
      updateTime = "update_time";

  final Database _database;

  BannerProvider(this._database) : assert(_database != null);

  @override
  createTableString() => """CREATE TABLE $tabName (
    $id   INTEGER PRIMARY KEY NOT NULL,
    $imgPath TEXT    NOT NULL,
    `$action` INT     NOT NULL,
    $bannerId INT     NOT NULL,
    $updateTime   INTEGER NOT NULL);""";

  @override
  String tableName() => tabName;

  Future<int> insert(List<BannerItem> banners) {
    var sqlStr = "insert into `banner` (`id`, `img_path`, `action`,`banner_id`,`update_time`) values (?,?,?,?,?);";
    var arguments = banners
        .map((e) =>
            [e.id, e.imgPath, e.action, e.bannerId, e.updateTime].toList())
        .toList();
    return _database.rawInsert(sqlStr, arguments);
  }
}
