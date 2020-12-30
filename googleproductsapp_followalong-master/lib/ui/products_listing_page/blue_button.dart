import 'package:flutter/material.dart';
import '../../models/product.dart';

class BlueButton extends StatelessWidget {
  final Product product;

  const BlueButton({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        height: 25,
        onPressed: () {},
        child: Text(
          product.buttonText,
          style: TextStyle(color: Colors.white, fontSize: 9),
        ),
        color: Color(0xFF0000FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ));
  }
}
