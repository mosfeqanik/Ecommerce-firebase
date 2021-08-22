import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wowsell/view/common_widgets/single_Product_View.dart';
import 'package:wowsell/view/screens/product_details.dart';

class ProductsRowForHomepage extends StatefulWidget {
  @override
  _ProductsRowForHomepageState createState() => _ProductsRowForHomepageState();
}

class _ProductsRowForHomepageState extends State<ProductsRowForHomepage> {
  var product_list = [
    {
      "name": "Shirt",
      "picture": "assets/images/cat11.jpg",
      "old_price": 1200,
      "price": 800,
    },
    {
      "name": "panjabi",
      "picture": "assets/images/cat3.jpg",
      "old_price": 2100,
      "price": 1700,
    },
    {
      "name": "Sun Glass",
      "picture": "assets/images/cat5.jpg",
      "old_price": 2100,
      "price": 1700,
    },
    {
      "name": "Watch",
      "picture": "assets/images/cat6.webp",
      "old_price": 2100,
      "price": 1700,
    },
    {
      "name": "Pant",
      "picture": "assets/images/cat2.webp",
      "old_price": 2100,
      "price": 1700,
    },
    {
      "name": "Saree",
      "picture": "assets/images/cat4.jpg",
      "old_price": 2100,
      "price": 1700,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SingleProductView(
            productName: product_list[index]['name'],
            productPictureUrl: product_list[index]['picture'],
            productPrice: product_list[index]['price'],
          );
        });
  }
}


