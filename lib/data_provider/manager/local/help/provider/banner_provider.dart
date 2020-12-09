import 'package:luckin_coffee_demo/common/common.dart';
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

  /// 插入數據
  Future<int> insert(List<BannerItem> banners) {
    // TODO  进行到这里卡主了
    var sqlStr =
        "insert into `$tabName` (`$id`, `$imgPath`, `$action`,`$bannerId`,`$updateTime`) values (?,?,?,?,?);";
    List<Future<int>> inserts = banners.map((e) =>
        _database.rawInsert(
            sqlStr, [e.id, e.imgPath, e.action, e.bannerId, e.updateTime])
    ).toList();
    Stream.fromFutures(inserts).map<Future<int>>((event) async {
      log.d("event$event");
      return await event;
    });


    // var arguments = banners
    //     .map((e) => [e.id, e.imgPath, e.action, e.bannerId, e.updateTime])
    //     .toList();
    // _database.i
    return null;
  }

  /// 查询所有的记录
  Future<List<BannerItem>> queryAll() {
    var sqlStr = "SELECT * FROM `$tabName`;";
    return _database.rawQuery(sqlStr).then((value) {
      if (value.length <= 0) return Future.value(null);
      return Future.value(value.map((e) => BannerItem.fromJson(e)).toList());
    });
  }

  /// 更新 banneritem 记录 并返回 更新调数
  Future<int> updateBanner(List<BannerItem> banners) async {
    var updateCount = 0;
    return queryRowCount().then((value) {
      if (value <= 0) return insert(banners);
      banners.forEach((element) {
        findById(element.id).then((value) async {
          if (value.length >= 0)
            updateCount += await insert(value);
          else
            updateCount +=
            await _database.rawUpdate(_buildSqlUpdate(value.first));
        });
      });
      return updateCount;
    });
  }

  /// 根据Id 查询 该条记录是否存在
  Future<List<BannerItem>> findById(String itemId) {
    var sqlSt = "SELECT * FROM $tabName where `$id`= '$itemId';";
    return _database.rawQuery(sqlSt).then((value) {
      if (value.length <= 0) return List();
      return value.map((e) => BannerItem.fromJson(e)).toList();
    });
  }

  _buildSqlUpdate(BannerItem banner) => """
  UPDATE `$tabName`
   SET `$imgPath` = ${banner.imgPath},
       `$action` = ${banner.action},
       `$bannerId` = ${banner.bannerId},
       `$updateTime` =${banner.updateTime} 
   WHERE `$id` = '${banner.id}' AND 
       `$updateTime` < ${banner.updateTime};
  """;

  /// 查詢当前表中与多少条数据
  Future<int> queryRowCount() {
    var sqlStr = "SELECT COUNT(*) as count FROM `$tabName`;";
    return _database.rawQuery(sqlStr).then((value) => value[0]["count"]);
  }
}
