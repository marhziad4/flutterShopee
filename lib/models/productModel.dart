class Product{
  String id;
  String price;
  String name;
  String img;

  Product({this.id, this.price, this.name, this.img});
  Product.fromJson(Map<String,dynamic> map,String id):this.id = id?? ''
  ,this.price = map['price']??''
  ,this.name = map['name']??''
  ,this.img = map['img']??'';


  toJson(){
    return{
      'id':id,
      'name':name,
      'price':price,
      'img':img,

    };
  }


}