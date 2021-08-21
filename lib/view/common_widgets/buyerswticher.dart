import 'package:flutter/material.dart';

class buyerSwitcherSeller extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Switch(
        activeTrackColor: Color.fromRGBO(211,211,211,0.9),
        activeColor: Color.fromRGBO(0, 0, 0, 1),
        inactiveTrackColor: Color.fromRGBO(4, 248, 207, 1),
        inactiveThumbColor: Color.fromRGBO(4, 248, 207, .9),
        // value: _isBuyer,
        onChanged: (val) {
          // setState(() {
          //   _isBuyer = val;
          //   print(_isBuyer);
          // });
        });
  }
}
