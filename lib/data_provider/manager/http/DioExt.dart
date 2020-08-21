import 'package:dio/dio.dart';
import 'package:luckin_coffee_demo/common/global.dart';

extension DioExt on Dio{
  Dio buildOptions({BaseOptions options}) {
    if (options != null)
      this.options = options;
    else {
      this.options = BaseOptions(
        connectTimeout: 10 * 1000,
        receiveTimeout: 20 * 1000,
        baseUrl: BASE_URL,
      );
    }
    this.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );
    return this;
  }
}
