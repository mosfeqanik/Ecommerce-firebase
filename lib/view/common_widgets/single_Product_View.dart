import 'package:flutter/material.dart';
import 'package:wowsell/view/screens/product_details.dart';

class SingleProductView extends StatelessWidget {
  final productName;
  final productPictureUrl;
  final productPrice;

  SingleProductView(
      {this.productName,
        this.productPictureUrl,
        this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: productName,
        child: InkWell(
          onTap: () => Navigator.of(context).push( MaterialPageRoute(
              builder: (context) =>  ProductDetails(
                productDetailName: productName,
                productDetailPrice: productPrice,
                productDetailPicture: productPictureUrl,
              ))),
          child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    productName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    "\$$productPrice",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              child: Image.asset(
                productPictureUrl,
                fit: BoxFit.cover,
              )),
        ),
      ),
    );
  }
}