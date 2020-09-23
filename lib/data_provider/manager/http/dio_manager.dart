import 'dart:io';

import 'package:dio/dio.dart';
import 'package:luckin_coffee_demo/data_provider/data_provider.dart';
import 'package:luckin_coffee_demo/exceptions/exception.dart';

/// DIO 网络请求 简单封装
class DioManager {
  static final DioManager _instance = DioManager._internal();
  Dio _dio;

  factory DioManager() => _instance;

  Dio get getDio => _dio;

  DioManager._internal() {
    if (_dio == null) _dio = Dio()..buildOptions();
  }

  /// method 方法
  /// path 请求路径
  /// params 请求参数
  /// success
  /// error
  /// Future<T> 返回参数
  Future<BaseEntity> request<T>(Method method, String path,
      {Map<String, dynamic> params}) async {
    try {
      Response response = await _dio.request(
        path,
        queryParameters: params,
        options: Options(
          method: MethodValues[method],
        ),
      );
      if (response == null)
        return Future.error(BaseEntity(code: -1, message: "未知错误"));
      else {
        if (response.data["code"] == 0)
          return Future.value(BaseEntity<T>.fromJson(response.data));
        else
          return Future.error(BaseEntity.fromJson(response.data));
      }
    } on DioError catch (error) {
      return Future.error(createErrorEntity(error));
    } on DataException catch (error) {
      return Future.error(BaseEntity(
        code: -1,
        message: "${error.message}",
        result: "${error.errInfo}",
      ));
    } catch (error) {
      return Future.error(BaseEntity(code: -1, message: "$error"));
    }
  }

  /// path 请求路径
  /// params 请求参数
  /// success
  /// error
  /// Future<T> 返回参数
  Future<BaseEntity> get<T>(String path, {Map<String, dynamic> params}) async {
    return request<T>(Method.GET, path, params: params);
  }

  /// path 请求路径
  /// params 请求参数
  /// success
  /// error
  /// Future<T> 返回参数
  Future<BaseEntity> post<T>(String path, {Map<String, dynamic> params}) async {
    return request(Method.POST, path, params: params);
  }

  // 错误信息
  BaseEntity createErrorEntity(DioError error) {
    switch (error.type) {
      case DioErrorType.CANCEL:
        return BaseEntity(code: -1, message: "请求取消");
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        return BaseEntity(code: -1, message: "连接超时");
        break;
      case DioErrorType.SEND_TIMEOUT:
        return BaseEntity(code: -1, message: "请求超时");
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        return BaseEntity(code: -1, message: "响应超时");
      case DioErrorType.RESPONSE:
        return BaseEntity(code: -1, message: "未知错误");
      default:
        if (error.error is SocketException)
          return BaseEntity(code: -1, message: "请检查网络连接");
        else
          return BaseEntity(code: -1, message: error.error);
    }
  }
}

enum Method { GET, POST, DELETE, PUT }

const MethodValues = {
  Method.GET: "get",
  Method.POST: "post",
  Method.DELETE: "delete",
  Method.PUT: "put"
};
