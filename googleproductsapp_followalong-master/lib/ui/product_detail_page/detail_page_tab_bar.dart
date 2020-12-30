import 'package:flutter/material.dart';

class DetailPageTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.symmetric(horizontal: 32),
      height: 50,
      child: Row(
        children: [
          GestureDetector(
            child: Icon(
              Icons.arrow_back,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Spacer(),
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(
            width: 17,
          ),
          Image.asset("assets/icons/menu.png", height: 30, color: Colors.white),
        ],
      ),
    );
  }
}
