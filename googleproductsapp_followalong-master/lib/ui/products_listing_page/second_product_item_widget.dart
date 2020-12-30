import 'package:flutter/material.dart';
import '../../models/product.dart';

class SecondProductItemWidget extends StatelessWidget {
  final Product product;
  final screenHeight;
  const SecondProductItemWidget({Key key, this.product, this.screenHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: product.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            product.imagePath,
            height: screenHeight * 0.15,
          ),
          Text(product.name, style: TextStyle(fontSize: 12)),
          SizedBox(
            height: 5,
          ),
          Text(product.description, style: TextStyle(fontSize: 7)),
        ],
      ),
    );
  }
}
