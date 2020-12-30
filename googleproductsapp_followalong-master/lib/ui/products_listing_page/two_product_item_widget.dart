import 'package:flutter/material.dart';
import '../../models/product.dart';
import './first_product_item_widget.dart';
import './second_product_item_widget.dart';

class TwoProductItemWidget extends StatelessWidget {
  final Product product1, product2;
  final screenHeight;

  const TwoProductItemWidget(
      {Key key, this.product1, this.product2, this.screenHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.25,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: FirstProductItemWidget(
                product: product1, screenHeight: screenHeight),
          ),
          Expanded(
            flex: 1,
            child: SecondProductItemWidget(
                product: product2, screenHeight: screenHeight),
          ),
        ],
      ),
    );
  }
}
