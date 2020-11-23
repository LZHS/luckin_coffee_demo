abstract class BaseDBProvider{

  bool isTableExits = false;

  createTableString();

  String tableName();

  ///创建表sql语句
  _tableBaseString(String sql) {
    return sql;
  }
}