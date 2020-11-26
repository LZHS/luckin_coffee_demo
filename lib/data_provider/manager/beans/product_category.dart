
class ProductCategory{
  int _categoryId;
  String _categoryName;
  int _categorySort;
  int _updateTime;

  ProductCategory({int categoryId,
    String categoryName,
    int categorySort,
    int updateTime}) {
    this._categoryId = categoryId;
    this._categoryName = categoryName;
    this._categorySort = categorySort;
    this._updateTime = updateTime;
  }

  int get categoryId => _categoryId;

  set categoryId(categoryId) => _categoryId = categoryId;

  String get categoryName => _categoryName;

  set categoryName(categoryName) => _categoryName = categoryName;

  int get categorySort => _categorySort;

  set categorySort(categorySort) => _categorySort = categorySort;

  int get updateTime => _updateTime;

  set updateTime(updateTime) => _updateTime = updateTime;

  ProductCategory.fromJson(Map<String, dynamic> json) {
    _categoryId = json['category_id'];
    _categoryName = json['category_name'];
    _categorySort = json['category_sort'];
    _updateTime = json['update_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this._categoryId;
    data['category_name'] = this._categoryName;
    data['category_sort'] = this._categorySort;
    data['update_time'] = this._updateTime;
    return data;
  }

  @override
  String toString() {
    return 'ProductCategory{_categoryId: $_categoryId, _categoryName: $_categoryName, _categorySort: $_categorySort, _updateTime: $_updateTime}';
  }
}