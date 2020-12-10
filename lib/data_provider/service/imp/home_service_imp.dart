
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
  Future<BaseEntity> getHomeTopBannerData() async {
    if (Global.connectivityResult != ConnectivityResult.none) {
      BaseEntity data = await _dioManager.get<List<BannerItem>>(GET_APP_BANNER);
      if (data.code == 0) {
        List<BannerItem> banners = data.result;
        if (banners.length <= 0)
          return Future.error(BaseEntity(code: -1, message: "服务器返回了0条数据"));
        int count = await _provider.updateBanner(banners);
        log.d("服务器返回了${banners.length}条数据,数据库更新了$count条数据。");
      }
    }
    return _provider.queryAll(BannerType.TOP).then(
      (value) {
        if (value == null || value.length <= 0)
          return Future.error(BaseEntity(code: -1, message: "本地數據爲空"));
        return BaseEntity(code: 0, message: "", result: value);
      },
    );
  }
}