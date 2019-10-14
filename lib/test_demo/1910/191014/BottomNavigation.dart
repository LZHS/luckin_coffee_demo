
import 'package:flutter/material.dart';

import 'BottomNavigationWidget.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter bottomNavigationBar', 
      home: BottomNavigationWidget(),
//    home: NavigationKeepAlive(),
    );
  }
}