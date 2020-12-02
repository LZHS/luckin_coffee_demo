import 'package:dio/dio.dart';

import '../data_provider.dart';

abstract class AppService {
  Future<BaseEntity> getAppVersion(String appId);

  Future<BaseEntity> download(
      String urlPath, savePath, ProgressCallback onReceiveProgress);
}
