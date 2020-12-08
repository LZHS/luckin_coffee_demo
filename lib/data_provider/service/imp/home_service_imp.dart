
import 'package:connectivity/connectivity.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:luckin_coffee_demo/data_provider/data_provider.dart';
import 'package:luckin_coffee_demo/data_provider/manager/local/help/provider/banner_provider.dart';

class HomeServiceImp extends HomeService {
  static const GET_APP_BANNER = "home/getBanner";

  static final HomeServiceImp _instance = HomeServiceImp._internal();
  DioManager _dioManager;


  factory HomeServiceImp() => _instance;

  HomeServiceImp._internal() {
    if (_dioManager == null) _dioManager = DioManager();
  }

  @override
  Future<BaseEntity> getHomeData() async {
    // if(Global.connectivityResult!=ConnectivityResult.none)
    DatabaseManager().getProvider(BannerProvider.className)
   return _dioManager.get<List<BannerItem>>(GET_APP_BANNER);
    // return _dioManager.get(GET_APP_BANNER).catchError((value) {
    //   // if(value is BaseEntity)
    //   //   if(value.code==-404)
    //   //     return
    //   return Future.error(value);
    // });
  }
}