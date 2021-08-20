import 'package:flutter/material.dart';

class Cart_Products extends StatefulWidget {
  @override
  _Cart_ProductsState createState() => _Cart_ProductsState();
}

class _Cart_ProductsState extends State<Cart_Products> {
  var Products_on_the_cart = [
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
    return new ListView.builder(
        itemCount: Products_on_the_cart.length,
        itemBuilder: (context, index) {
          return Single_cart_product(
            cart_prod_name: Products_on_the_cart[index]["name"],
            cart_prod_price: Products_on_the_cart[index]["price"],
            cart_prod_picture: Products_on_the_cart[index]["picture"],
          );
        });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_price;
  final cart_prod_picture;

  Single_cart_product(
      {this.cart_prod_name, this.cart_prod_price, this.cart_prod_picture});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: new Image.asset(
          cart_prod_picture,
          width: 80.0,
          height: 80.0,
        ),
        title: new Text(cart_prod_name),
        subtitle: new Column(
          children: <Widget>[
            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "\$${cart_prod_price}",
                style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            )
          ],
        ),
        trailing: new Column(
          children: <Widget>[
            GestureDetector(onTap: () {}, child: new Icon(Icons.arrow_drop_up)),
            GestureDetector(
                onTap: () {}, child: new Icon(Icons.arrow_drop_down)),
          ],
        ),
      ),
    );
  }
}
