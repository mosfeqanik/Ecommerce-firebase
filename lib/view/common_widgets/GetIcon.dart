import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetIcon extends StatelessWidget {
  final Color iconColor;
  final Color iconBgColor;

  final IconData iconPic;
  final Function onTapOnIcon;

  GetIcon({this.iconColor, this.iconBgColor, this.iconPic, this.onTapOnIcon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: iconBgColor,
      child: IconButton(
        icon: Icon(
          iconPic,
          color: iconColor,
        ),
        onPressed: () {
          onTapOnIcon;
        },
      ),
    );
  }
}