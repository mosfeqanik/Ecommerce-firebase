class ProductList{
  int id;
  String productName;
  String productImg;
  String productPrice;

  ProductList({this.id, this.productName, this.productImg, this.productPrice});

  Map<String,dynamic> toMap(){
    return <String,dynamic>{
      "id":id,
      "productName":productName,
      "productImg":productImg,
      "productPrice":productPrice
    };
  }
}
