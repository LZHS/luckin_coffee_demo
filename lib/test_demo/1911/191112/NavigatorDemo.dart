import 'package:flutter/material.dart';
import 'package:flutter_demo/common_utils.dart';

class NavigatorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter 路由 Demo",
      initialRoute: "HomePage",
      routes: {
        "HomePage": (context) => HomePage(),
        "SubPage": (context) => SubPage()
      },
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  final List<String> datas = ["橘子", "香蕉", "苹果"];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("主页面"),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text("跳转至下一个页面"),
            onPressed: () => _navigateAndDisplaySelection(context),
          ),
        ),
      ),
    );
  }

  _navigateAndDisplaySelection(BuildContext context) {
    Log.d("点击了跳转至下一个页面");
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => SubPage()),
    // );
    Navigator.pushNamed(context, "SubPage");
  }
}

class SubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("子页面"),
        leading: IconButton( 
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            var isPop = Navigator.pop(context);
            Log.d("是否返回${isPop ? "成功" : "失敗"}了");
          },
        ),
      ),
      body: Center(
        child: Text("这个是子页面"),
      ),
    );
  }
}
