import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final String label;
  final TextEditingController inputTextEditController;
  InputTextField({this.label,this.inputTextEditController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          controller: inputTextEditController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
