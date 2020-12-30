import 'package:flutter/material.dart';
import 'package:googleproductsapp/ui/products_listing_page/red_button.dart';
import '../../models/product.dart';

class DetailContent extends StatelessWidget {
  final Product product;
  final screenWidth, screenHeight;

  const DetailContent(
      {Key key, this.product, this.screenWidth, this.screenHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: screenHeight * 0.2),
      child: Column(
        children: [
          Container(
            child:Hero(
              tag: product.name,
                child: Image.asset(
                  product.imagePath,
                ),
            )

          ),
          Row(
            children: [
              Text('Starting*',
                  style: TextStyle(
                      color: Colors.grey[600], fontWeight: FontWeight.bold)),
              Spacer(),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: '\$'.replaceAll('', '') + ('\t'),
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFF0000FF),
                    ),
                  ),
                  TextSpan(
                    text: product.price,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF0000FF),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ]),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text(
                product.name.replaceAll('\n', ' ') + ('\t\t\t\t'),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              Image.asset(
                'assets/images/stadia_logo.png',
                height: 20,
              )
            ],
          ),
          SizedBox(
            height: 9,
          ),
          Text(
            product.productInfo,
            style: TextStyle(
              color: Colors.grey[800],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/create.png',
                      height: 30,
                      color: Colors.red[600],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Create',
                      style: TextStyle(
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/connect.png',
                      height: 30,
                      color: Colors.red[600],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Connect',
                      style: TextStyle(
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/discover.png',
                      height: 30,
                      color: Colors.red[600],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Discover',
                      style: TextStyle(
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Divider(
            height: 1,
            color: Colors.black12,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RedButton(
                buttonText: 'PRE-ORDER',
              ),
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0, // soften the shadow
                      spreadRadius: 2.0, //extend the shadow
                      offset: Offset(
                        0.0, // Move to right 10  horizontally
                        5.0, // Move to bottom 5 Vertically
                      ),
                    )
                  ],
                ),
                child: Icon(
                  Icons.add,
                  size: 23,
                  color: Colors.blue[900],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
