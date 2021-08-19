import 'package:carousel_pro/carousel_pro.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wowsell/components/cart.dart';
import 'package:wowsell/components/horizontal_listview.dart';
import 'package:wowsell/components/product_view.dart';
import 'package:wowsell/view/screens/mainpage/navigation_bar_App_bar_Drawer.dart';


class Coder extends StatefulWidget {


  @override
  _CoderState createState() => _CoderState();
}

class _CoderState extends State<Coder> {


  var _page = 1;

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
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: <Color>[
                      Color.fromRGBO(4, 248, 207, 1),
                      Color.fromRGBO(251, 243, 100, 1),
                    ])),
                child: Container(
                  child: Column(
                    children: [
                      Material(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        elevation: 10,
                        child: Image.asset(
                          "assets/images/wow_sell_round.png",
                          width: 100,
                          height: 100,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('E-Commerce application')
                    ],
                  ),
                ),
              ),
              CustomListTile(
                icon: Icons.person,
                texttitle: "Group Members",
                ontap: () => {},
              ),
              CustomListTile(
                icon: Icons.star,
                texttitle: "Md Mosfeq Anik",
                ontap: () => {},
              ),
              CustomListTile(
                icon: Icons.star,
                texttitle: "Pritom Chowdhury",
                ontap: () => {},
              ),
              CustomListTile(
                icon: Icons.engineering,
                texttitle: "Supervised By",
                ontap: () => {},
              ),
              CustomListTile(
                icon: Icons.assistant_photo,
                texttitle: "Ebrahim Joy",
                ontap: () => {},
              ),
              Divider(),
              ListTile(
                title: Text('0.0.1'),
              )
            ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: 1,
          color: Colors.white,
          animationCurve: Curves.easeIn,
          animationDuration: Duration(milliseconds: 600),
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.black,
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          items: [
            Icon(
              FontAwesomeIcons.bookmark,
              size: 25,
            ),
            Icon(
              Icons.house,
              size: 25,
            ),
            Icon(
              Icons.shopping_cart_outlined,
              size: 25,
            ),
          ],
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

