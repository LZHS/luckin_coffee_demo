import 'package:luckin_coffee_demo/data_provider/data_provider.dart';

abstract class AppService {
  Future<BaseEntity> getAppVersion(String appId);
}
