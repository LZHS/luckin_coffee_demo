import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common.dart';

import 'hero_page_b.dart';

class HeroPageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HeroPageA"),
      ),
      body: Container(
        child: Hero(
            tag: "Hero",
            child: Image.asset(
              "lib/assets/images/banners/icon_banner01.jpg",
              fit: BoxFit.cover,
              width: 150.0,
              height: 80.0,
            )),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: () {
          Navigator.push(context, PageRouteBuilder(pageBuilder:
              (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
            return FadeTransition(
              opacity: animation,
              child: HeroPageB(),
            );
          }));
        },
      ),
    );
  }
}
