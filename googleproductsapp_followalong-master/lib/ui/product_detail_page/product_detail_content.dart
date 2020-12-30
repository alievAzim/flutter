import 'package:flutter/material.dart';
import './detail_content.dart';
import '../../models/product.dart';
import './detail_page_tab_bar.dart';

class ProductDetailContent extends StatelessWidget {
  final screenWidth, screenHeight;
  final Product product;

  const ProductDetailContent(
      {Key key, this.screenWidth, this.screenHeight, this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailPageTabBar(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: DetailContent(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              product: product),
        ),
      ],
    );
  }
}
