import 'package:dio/dio.dart';
import 'package:luckin_coffee_demo/data_provider/data_provider.dart';

abstract class AppService {
  Future<BaseEntity> getAppVersion(String appId);

  Future<BaseEntity> download(
      String urlPath, savePath, ProgressCallback onReceiveProgress);
}
