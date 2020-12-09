
import 'package:connectivity/connectivity.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:luckin_coffee_demo/data_provider/data_provider.dart';
import 'package:luckin_coffee_demo/data_provider/manager/local/help/provider/banner_provider.dart';

class HomeServiceImp extends HomeService {
  static const GET_APP_BANNER = "home/getBanner";

  static final HomeServiceImp _instance = HomeServiceImp._internal();
  DioManager _dioManager;
  BannerProvider _provider;

  factory HomeServiceImp() => _instance;

  HomeServiceImp._internal() {
    if (_dioManager == null) _dioManager = DioManager();
    _provider = DatabaseManager().getProvider(BannerProvider.className)
        as BannerProvider;
  }

  @override
  Future<BaseEntity> getHomeData() async {
    if (Global.connectivityResult != ConnectivityResult.none) {
      BaseEntity data = await _dioManager.get<List<BannerItem>>(GET_APP_BANNER);
      if (data.code == 0) {
        List<BannerItem> banners = data.result;
        if (banners.length <= 0)
          return Future.error(BaseEntity(code: -1, message: "服务器返回了0条数据"));
        int count = await _provider.updateBanner(banners);
        log.d("總共${banners.length}條數據，更新了 $count 數據");
      }
    }
    return _provider
        .queryAll()
        .then((value) {
      if (value==null||value.length <= 0)
        return Future.error(BaseEntity(code: -1, message: "本地數據爲空"));
      return BaseEntity(code: 0, message: "", result: value);
    });
  }
}