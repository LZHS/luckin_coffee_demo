import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'RandomWords.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Welcome to Flutter",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Welcome to Flutter"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: () { },
            )
          ],
        ),
        body: Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}

//todo https://github.com/nicholaslie90/flutter_shrine
