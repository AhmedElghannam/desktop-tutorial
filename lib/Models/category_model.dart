
class CategoryModel{
  int _cId;
  String _cName;

  String _cAvatar;

  int get cId => _cId;


  String get cName => _cName;
  String get cAvatar => _cAvatar;


  CategoryModel.fromJson(dynamic cat) {
    _cId = cat['id'];
    _cName = cat["name"];
    _cAvatar = cat["avatar"];
  }
/*
  CategoryModel.fromJson(dynamic json) {
    _cId = json['categories']["id"];
    _cName = json['categories']["name"];
    _cAvatar = json['categories']["avatar"];
  }
   */
}