import 'package:flutter/material.dart';

class InputPasswordField extends StatelessWidget {
  final String label;
  final bool isObscure;

  InputPasswordField({this.label, this.isObscure});

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
          obscureText: isObscure,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400])),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400])),
            // suffixIcon: _obscureText == true
            //     ? IconButton(
            //     onPressed: () {
            //       setState(() {
            //         _obscureText = false;
            //       });
            //     },
            //     icon: Icon(
            //       Icons.remove_red_eye,
            //       size: 20,
            //     ))
            //     : IconButton(
            //     onPressed: () {
            //       setState(() {
            //         _obscureText = true;
            //       });
            //     },
            //     icon: Icon(
            //       Icons.visibility_off,
            //       size: 20,
            //     )),
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
