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
  List<String> _carouselImages = [];
  var _fireStoreInstance = FirebaseFirestore.instance;

  fetchCarouselImage() async {
    QuerySnapshot carouselCollection =
    await _fireStoreInstance.collection("carousel_slider").get();
    setState(() {
      for (int i = 0; i < carouselCollection.docs.length; i++) {
        _carouselImages.add(carouselCollection.docs[i]["img-path"]);
      }
    });
    return carouselCollection.docs;
  }

  @override
  void initState() {
    fetchCarouselImage();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          HomePageCarouselSlider(carouselImages:_carouselImages),
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

