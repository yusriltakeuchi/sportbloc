import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  TextInputAction action;
  TextInputType type;
  String hintText;
  Function(String value) onChange;

  CustomTextField({
    @required this.action,
    @required this.type,
    @required this.hintText,
    @required this.onChange
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: TextField(
        textInputAction: action,
        keyboardType: type,
        onChanged: onChange,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2)
          ),
          hintText: hintText,
        ),
      )
    );
  }
}