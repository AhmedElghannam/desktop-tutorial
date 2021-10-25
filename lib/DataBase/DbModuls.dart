class DbModel{
  String _name;
  String _title;
  String _image;
  num _price;
  num _total;
  num _amount;
  num _inStock;
  int _id;


  int get id => _id;

  num get inStock => _inStock;

  num get amount => _amount;

  String get name => _name;

  String get title => _title;

  num get total => _total;

  num get price => _price;

  String get image => _image;

  DbModel(this._name,this._title,this._image,this._price,this._amount,this._total,this._inStock);
/*
DbModel(dynamic map){
    _name=map['name'];
    _title=map['title'];
    _image=map['image'];
    _price=map['price'];
    _amount=map['amount'];
    _total=map['total'];
  }
 */

  DbModel.fromMap(dynamic map){
    _name=map['name'];
    _title=map['title'];
    _image=map['image'];
    _price=map['price'];
    _amount=map['amount'];
    _total=map['total'];
    _inStock=map['inStock'];
    _id=map['id'];

  }

  Map<String,dynamic> toMap()=>{
    'name':_name,'title':_title,'image':_image,'price':_price,'total':_total,'amount':_amount,'inStock':_inStock
  };

}