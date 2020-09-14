import 'package:dio/dio.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:luckin_coffee_demo/data_provider/data_provider.dart';
import 'package:luckin_coffee_demo/data_provider/manager/beans/app_version.dart';

class AppServiceImp extends AppService {
  static const GET_APP_VERSION = "app/getAppVersion";

  static final AppServiceImp _instance = AppServiceImp._internal();
  DioManager _dioManager;

  factory AppServiceImp() => _instance;

  AppServiceImp._internal() {
    if (_dioManager == null) _dioManager = DioManager();
  }

  @override
  Future<BaseEntity> getAppVersion(String appId) {
    return _dioManager
        .get<AppVersion>(GET_APP_VERSION, params: {"appId": appId});
  }

  @override
  Future<BaseEntity> download(
      String urlPath, savePath, onReceiveProgress) async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    await dio.download(urlPath, savePath,
        onReceiveProgress: ((int count, int total) {
      onReceiveProgress(count, total);
    }));
  }
}
