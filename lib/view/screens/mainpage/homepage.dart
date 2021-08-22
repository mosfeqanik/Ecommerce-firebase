import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:wowsell/components/horizontal_listview.dart';
import 'package:wowsell/view/common_widgets/Products_Row_For_Homepage.dart';
import 'package:wowsell/view/common_widgets/homepage_Carousel_Slider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _fireStoreInstance = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          HomePageCarouselSlider(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Categories'),
          ),
          HorizontalList(),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('Wowsell Recent Productcs'),
          ),
          Container(
            height: 320.0,
            child: ProductsRowForHomepage(),
          )
        ],
      ),
    );
  }


}

