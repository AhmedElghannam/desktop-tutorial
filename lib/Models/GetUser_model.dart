class GetUserModel{
  String _name;
  String _email;
  String get name=>_name;
  String get email=>_email;

  GetUserModel.fromJson(dynamic json){
    _name=json['name'];
    _email=json['email'];
  }

}