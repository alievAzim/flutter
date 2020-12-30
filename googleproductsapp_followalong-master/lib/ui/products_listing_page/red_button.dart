import 'package:flutter/material.dart';

class RedButton extends StatelessWidget {
  final String buttonText;

  const RedButton({Key key, this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      height: 35,
      onPressed: () {},
      padding: EdgeInsets.symmetric(horizontal: 80),
      child: Text(
        buttonText.toUpperCase(),
        style: TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 1),
      ),
      color: Color(0xFFFF0000),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}
