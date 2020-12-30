import 'package:flutter/material.dart';
import './TopBar.dart';
import './right_image_product_item_widget.dart';
import './left_image_product_item_widget.dart';
import '../../models/product.dart';
import './two_product_item_widget.dart';
import './red_button.dart';

class ProductsListingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(16),
          child: Image.asset('assets/images/google_logo.png'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset('assets/icons/menu.png'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(),
            SizedBox(
              height: 10,
            ),
            RightImageProductItemWidget(
                screenHeight: screenHeight, product: pixel),
            LeftImageProductItemWidget(
                screenHeight: screenHeight, product: stadia),
            TwoProductItemWidget(
                screenHeight: screenHeight,
                product1: pixelStand,
                product2: dayDreamView),
            SizedBox(
              height: 5,
            ),
            RedButton(buttonText: 'view all')
          ],
        ),
      ),
    );
  }
}
