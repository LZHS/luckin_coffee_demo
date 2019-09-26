import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.red[500]),
      title: "ContainerDemo",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ContainerDemo"),
        ),
        body: _getBody(context),
      ),
    );
  }

  Widget _getBody(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[500],
        border: Border.all(
          width: 2.0,
          color: Colors.red,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        image: DecorationImage(
            image: NetworkImage(
                "http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg"),
            centerSlice: Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0)),
      ),
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: Text(
        "Hello World",
        style:
            Theme.of(context).textTheme.display1.copyWith(color: Colors.black),
      ),
      transform: Matrix4.rotationZ(0.3),
    );
  }
}


//参考文档  https://juejin.im/post/5b13c3e1f265da6e3d666d80