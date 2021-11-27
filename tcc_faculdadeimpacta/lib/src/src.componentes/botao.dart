import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  late String btnText;

  Button({required this.btnText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
          color: Color(0xFFFF005C), borderRadius: BorderRadius.circular(10.0)),
      child: Center(
        child: Text(
          "$btnText",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}