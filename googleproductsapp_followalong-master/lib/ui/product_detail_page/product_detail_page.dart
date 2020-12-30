import 'package:flutter/material.dart';
import './product_detail_content.dart';
import './product_detail_stuck_elements.dart';
import '../../models/product.dart';

class ProductDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          ProductDetailStuckElements(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
          ),
          SingleChildScrollView(
            child: ProductDetailContent(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                product: stadia),
          )
        ],
      ),
    );
  }
}
