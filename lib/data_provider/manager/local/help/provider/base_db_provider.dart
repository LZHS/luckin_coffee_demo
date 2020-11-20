abstract class BaseDBProvider{

  bool isTableExits = false;

  createTableString();

  _tableName();

  ///创建表sql语句
  _tableBaseString(String sql) {
    return sql;
  }
}