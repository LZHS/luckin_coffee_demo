import 'package:flutter/material.dart';
import 'package:flutter_demo/test_demo/1910/191014/pages/AirlpayScreen.dart';
import 'package:flutter_demo/test_demo/1910/191014/pages/EmailScreen.dart';
import 'package:flutter_demo/test_demo/1910/191014/pages/HomeScreen.dart';
import 'package:flutter_demo/test_demo/1910/191014/pages/PortraitScreen.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> pages = List<Widget>();

  @override
  void initState() { 
    pages
      ..add(HomeScreen())
      ..add(EmailScreen())
      ..add(AirlpayScreen())
      ..add(PortraitScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _bottomNavigationColor,
            ),
            title: Text(
              "HOME",
              style: TextStyle(
                color: _bottomNavigationColor,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
              color: _bottomNavigationColor,
            ),
            title: Text(
              "Email",
              style: TextStyle(
                color: _bottomNavigationColor,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.airplay,
              color: _bottomNavigationColor,
            ),
            title: Text(
              "Airlpay",
              style: TextStyle(
                color: _bottomNavigationColor,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.portrait,
              color: _bottomNavigationColor,
            ),
            title: Text(
              "Portrait",
              style: TextStyle(
                color: _bottomNavigationColor,
              ),
            ),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            this._currentIndex = index;
          });
        },
        type: BottomNavigationBarType.shifting,
      ),
      body: pages[this._currentIndex],
    );
  }
}

// TODO  https://juejin.im/post/5b5d8d1c6fb9a04fd6596188
