import 'package:flutter/material.dart';
import '../product_detail_page/product_detail_page.dart';
import '../../models/product.dart';
import 'blue_button.dart';

class LeftImageProductItemWidget extends StatelessWidget {
  final screenHeight;
  final Product product;
  const LeftImageProductItemWidget({Key key, this.screenHeight, this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailPage(),
            ));
      },
      child: Container(
        height: screenHeight * 0.25,
        color: product.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 32),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Hero(
                  tag: product.name,
                  child: Image.asset(product.imagePath),
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 17),
                        ),
                        Text(product.description,
                            style: TextStyle(
                                color: Colors.brown[900], fontSize: 8)),
                        SizedBox(
                          height: 5,
                        ),
                        BlueButton(product: product),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
