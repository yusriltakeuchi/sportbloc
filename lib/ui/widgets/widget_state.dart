import 'package:flutter/material.dart';

class WidgetState {
  static Widget NotFound(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "DATA TIDAK DITEMUKAN",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black87,
          )
        ),
      ),
    );
  }

  static Widget Error(BuildContext context) {
    return Container(
      child: Center(
        child: Icon(Icons.error, color: Colors.red, size: 50),
      ),
    );
  }

  static Widget Loading(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator()
      ),
    );
  }
}