import 'package:flutter/material.dart';

class ButtonDesign extends StatelessWidget {

  final Color ?qButtonColor;
  final Color ?qButtonTextColor;
  final String ?qButtonTittle;
  final Function ?qButtonFunction;
  final double ?qButtonHeight;

  ButtonDesign({this.qButtonColor,this.qButtonTittle,this.qButtonFunction,this.qButtonHeight,this.qButtonTextColor}) ;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      color: qButtonColor,
      elevation: 0,
      height: qButtonHeight,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(10)),
      onPressed: () { qButtonFunction!; },
      child: Text(
        qButtonTittle!,
        style: TextStyle(color: qButtonTextColor,
            fontWeight: FontWeight.w600, fontSize: 18),
      ),
    );
  }
}
