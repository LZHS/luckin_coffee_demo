import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ExpandedDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5.0),
                child: Text("Flexble1"),
                color: Colors.blue,
              ),
              Flexible(
                flex: 10,
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  child: Text("Flexble"),
                  color: Colors.red,
                ),
              ),
              Flexible(
                flex: 10,
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  child: Text("Flexible"),
                  color: Colors.blue,
                ),
              ),
              Flexible(
                flex: 10,
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  child: Text("Flexible"),
                  color: Colors.blue,
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                child: Text("Flexible1"),
                color: Colors.blue,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5.0),
                child: Text("Flexible1"),
                color: Colors.blue,
              ),
              Flexible(
                flex: 1,
                child: Container(
                  child: Text("Flexible2"),
                  color: Colors.blue,
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                child: Text("Flexible3"),
                color: Colors.blue,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5.0),
                child: Text("Expanded1"),
                color: Colors.blue,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Text("Expanded2"),
                  color: Colors.blue,
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                child: Text("Expanded3"),
                color: Colors.blue,
              )
            ],
          ),
          Row(children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: Text("Expanded"),
                color: Colors.blue,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: Text("Expanded"),
                color: Colors.blue,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: Text("Expanded"),
                color: Colors.blue,
                alignment: Alignment.center,
              ),
            ),
          ])
        ],
      ),
    );
  }
}
