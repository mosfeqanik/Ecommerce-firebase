import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HorizontalList extends StatefulWidget{
  @override
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  @override
  Widget build(BuildContext context){
    return Container(
      height: 100.0,
      child: ListView(scrollDirection: Axis.horizontal,
        children: <Widget>[

          Category(
            image_location: 'assets/images/cat2.webp',
            image_caption: 'Pant',
          ),
          Category(
            image_location: 'assets/images/cat11.jpg',
            image_caption: 'Shirt',
          ),
          Category(
            image_location: 'assets/images/cat3.jpg',
            image_caption: 'Panjabi',
          ),
          Category(
            image_location: 'assets/images/cat4.jpg',
            image_caption: 'saree',
          ),
          Category(
            image_location: 'assets/images/cat5.jpg',
            image_caption: 'Glass',
          ),
          Category(
            image_location: 'assets/images/cat6.webp',
            image_caption: 'Watch',
          ),


        ],
      ),
    );
  }
}
class Category extends StatelessWidget{
  final String image_location;
  final String image_caption;
  Category({this.image_location, this.image_caption});
  @override
  Widget build(BuildContext context){
    return Padding(
        padding: const EdgeInsets.all(2.0),
    child: InkWell(
      onTap: (){},
      child: Container(
        width: 100.0,
        child: ListTile(
          title: Image.asset(
            image_location,
            width: 70.0,
            height: 80.0,
          ),
          subtitle: Container(
            alignment: Alignment.topCenter,
              child: Text(image_caption),
          ),
        ),

      ),
    ),
    );
  }


}