import 'package:flutter/material.dart';
import 'package:flutter_demo/test_demo/1911/191114/config/application.dart';

class DemoMessageComponent extends StatelessWidget {
  final String message;

  final Color color;

  DemoMessageComponent(
      {@required this.message, this.color = const Color(0xffffffff)});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: color,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("DemoMessageCo..."),
          leading: IconButton(
            color: Colors.yellow, 
            icon: Icon(
              Icons.arrow_back,
              color: Colors.red,
            ),
            onPressed: () {
              Application.router..pop(context,);
            },
          ),
        ),
        body: Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "message : ",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  "$message",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
