import 'dart:math';

import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common_utils.dart';

class AnimatedListSampleDemo extends StatefulWidget {
  AnimatedListSampleDemo({Key key}) : super(key: key);

  @override
  _AnimatedListSampleDemoState createState() => _AnimatedListSampleDemoState();
}

class _AnimatedListSampleDemoState extends State<AnimatedListSampleDemo> {
  Tween<Offset> myTween = Tween<Offset>(
    begin: Offset(1, 0),
    end: Offset(0, 0),
  );
  var _data = <String>[];
  final _myListKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String newv = Random().nextInt(1000).toString();
          _data.add(newv);
          var index = _data.lastIndexOf(newv);
          Log.d("index = $index");
          _myListKey.currentState.insertItem(index);
        },
        child: Icon(Icons.add),
      ),
      body: AnimatedList(
        key: _myListKey,
        initialItemCount: _data.length,
        itemBuilder: (context, int index, Animation<double> animation) {
          return myListItem(_data[index], animation);
        },
      ),
    );
  }

  Widget myListItem(String d, animation) {
    return SlideTransition(
      position: animation.drive(myTween),
      child: myItem(d),
    );
  }

  Widget myItem(String d) {
    return ListTile(
      title: Text(
        '${d}',
        style: TextStyle(fontSize: 40),
      ),
      trailing: IconButton(
        onPressed: () {
          var index = _data.indexOf(d);
          Log.d("index = $index");
          _data.remove(d);
          _myListKey.currentState.removeItem(
              index, (context, animation) => myListItem(d, animation));
        },
        icon: Icon(Icons.delete_forever),
      ),
    );
  }
}
