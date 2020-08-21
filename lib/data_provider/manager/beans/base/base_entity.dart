import 'package:luckin_coffee_demo/data_provider/manager/beans/entity_factory.dart';
import 'package:luckin_coffee_demo/exceptions/exception.dart';

class BaseEntity<T> {
  int code;
  String message;
  T result;

  BaseEntity({this.code, this.message, this.result});

  factory BaseEntity.fromJson(json) {
    try {
      return BaseEntity(
        code: json["code"],
        message: json["msg"],
        // data值需要经过工厂转换为我们传进来的类型
        result: EntityFactory.generateOBJ<T>(json["data"]),
      );
    } catch (error) {
      throw DataException("数据解析异常", "原始数据 ： $json");
    }
  }

  @override
  String toString() {
    return 'BaseEntity{code: $code, message: $message, result: $result}';
  }
}