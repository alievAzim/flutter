import 'package:flutter/material.dart';

class ProductDetailStuckElements extends StatelessWidget {
  final screenWidth, screenHeight;
  const ProductDetailStuckElements(
      {Key key, this.screenWidth, this.screenHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -screenWidth * 0.4,
          left: screenWidth * 0.3,
          child: Container(
            width: screenWidth * 1.2,
            height: screenWidth * 1.2,
            decoration: BoxDecoration(
              color: Color(0xFF0000FF),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: screenHeight * 0.18,
          left: screenWidth * 0.05,
          child: Image.asset(
            'assets/images/google_text_logo.png',
            width: screenWidth * 0.9,
            color: Color(0xFFECECECE).withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
