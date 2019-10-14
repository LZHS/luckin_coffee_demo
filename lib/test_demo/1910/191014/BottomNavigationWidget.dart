import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
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
              Icons.pages,
              color: _bottomNavigationColor,
            ),
            title: Text(
              "Pages",
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
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            this._currentIndex = index;
          });
        },
      ),
      appBar: AppBar(
        title: const Text("BottomNavigationWidget"),
      ),
      body: Container(),
    );
  }
}


// TODO  https://juejin.im/post/5b5d8d1c6fb9a04fd6596188