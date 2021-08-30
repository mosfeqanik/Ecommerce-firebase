import 'package:flutter/material.dart';

class CustomListTileForDrawer extends StatelessWidget {
  IconData icon;
  String textTitle;

  CustomListTileForDrawer({this.icon, this.textTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Column(
          children: <Widget>[
            Divider(),
            ListTile(leading: Icon(icon), title: Text(textTitle)),
          ],
        ),
      ),
    );
  }
}