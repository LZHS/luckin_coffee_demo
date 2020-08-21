import 'package:flutter/material.dart';

class HeroPageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("原图"),
      ),
      body: Container(
        child: Hero(
            tag: "Hero",
            child: Image.asset(
              "lib/assets/images/banners/icon_banner01.jpg",
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
