import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:wowsell/components/cart.dart';
import 'package:wowsell/components/horizontal_listview.dart';
import 'package:wowsell/components/product_view.dart';

class Coder extends StatefulWidget {


  @override
  _CoderState createState() => _CoderState();
}

class _CoderState extends State<Coder> {




  @override
  Widget build(BuildContext context) {

    Widget image_carousel = new Container(
      height: 200.0,
      child:  new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/images/promotion__one.png'),
          AssetImage('assets/images/promotion_three.png'),
          AssetImage('assets/images/four.png'),
          AssetImage('assets/images/promotion_two.png')

        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
        dotBgColor: Colors.transparent,
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "WoWSell",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 4.0,
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                size: 25,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  size: 25,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>new Cart()));
                }),
          ],
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: new ListView(
          children:<Widget> [
            image_carousel,

            new Padding(padding: const EdgeInsets.all(8.0),
              child: new Text('Categories'),
            ),
            HorizontalList(),

            new Padding(padding: const EdgeInsets.all(20.0),
              child: new Text('Wowsell Recent Productcs'),
            ),
            Container(
              height: 320.0,


              child: Products(),
            )


          ],

        )



    );
  }
}

