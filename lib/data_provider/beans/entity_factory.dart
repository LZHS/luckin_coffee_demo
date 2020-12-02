

import '../data_provider.dart';

class EntityFactory {
  static T generateOBJ<T>(json)  {
    if (json == null)
      return null;
    else if (T.toString() == "AppVersion") {
      return AppVersion.fromJson(json) as T;
    } else return json as T;
  }
}