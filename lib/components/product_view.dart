import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wowsell/view/screens/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
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
          return Single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod(
      {this.prod_name,
      this.prod_picture,
      this.prod_old_price,
      this.prod_price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prod_name,
        child: InkWell(
          onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (context) => new ProductDetails(
                    product_detail_name: prod_name,
                    product_detail_new_price: prod_price,
                    product_detail_old_price: prod_old_price,
                    product_detail_picture: prod_picture,
                  ))),
          child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    prod_name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    "\$$prod_price",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w800),
                  ),
                  subtitle: Text(
                    "\$$prod_old_price",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.lineThrough),
                  ),
                ),
              ),
              child: Image.asset(
                prod_picture,
                fit: BoxFit.cover,
              )),
        ),
      ),
    );
  }
}
