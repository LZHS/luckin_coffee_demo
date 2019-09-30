import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SamplePage extends StatelessWidget {
  const SamplePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5.0,
        centerTitle: true,
        title: Text(
          "发布成功",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.normal),
        ),
        leading: IconButton(
          icon: Image.asset("images/nav_close.png"),
          onPressed: () {
            Navigator.maybePop(context);
          },
        ),
      ),
      body: SamplePageContent(),
    );
  }
}

class SamplePageContent extends StatefulWidget {
  @override
  _SamplePageContentState createState() => _SamplePageContentState();
}

class _SamplePageContentState extends State<SamplePageContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top:42.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 52.0,
                height: 52.0,
                margin: EdgeInsets.only(left: 16.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage("images/avatar2.png"),
                ),
              ),
              // TODO 2019/09/30 17:32 文档编写到这里
              //https://github.com/yang7229693/flutter-study/blob/master/demo/3.%20Flutter%E5%B8%83%E5%B1%80/flutter_layout_demo/lib/sample_page.dart
            ],
          )
        ],
      ),
      
    );
  }
}
