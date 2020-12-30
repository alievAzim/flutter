import 'package:flutter/material.dart';
import '../../models/product.dart';
import './blue_button.dart';

class RightImageProductItemWidget extends StatelessWidget {
  final screenHeight;
  final Product product;
  const RightImageProductItemWidget({Key key, this.screenHeight, this.product})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.3,
      color: product.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 32),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.description,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 10),
                  BlueButton(
                    product: product,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Positioned(
                    bottom: -50,
                    top: 20,
                    right: -20,
                    child: Transform.rotate(
                      angle: -0.3,
                      child: Image.asset(product.imagePath),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
