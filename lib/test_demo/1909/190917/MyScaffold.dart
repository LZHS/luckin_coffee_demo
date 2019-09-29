import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  // Widget子类中的字段往往都会定义为"final"

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56.0, // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      // Row 是水平方向的线性布局（linear layout）
      child: new Row(
        //列表项的类型是 <Widget>
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // null 会禁用 button
          ),
          // Expanded expands its child to fill the available space.
          new Expanded(
            child: title,
          ),
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    // Material 是UI呈现的“一张纸”
    return new Material(
      // Column is 垂直方向的线性布局.
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          new Expanded(
            child: new Center(
              child: new Text('Hello, world!'),
            ),
          ),
        ],
      ),
    );
  }
}

/*
基础Widget
Flutter 有一套丰富、强大的基础widget，其中以下是很常用的：

* Text：该widget可让创建一个带格式的文本。

* Row、Column：这些具有弹性空间的布局类Widget可让您在水平（Row）和垂直（Column）方向上创建灵活的布局。其设计是基于web开发中Flexbox布局模型。

* Stack：取代线性布局（与Android中的LinearLayout相似），Stack 允许子widget堆叠，你可以使用Positioned来定位他们的相对于Stack的上下左右四条边的位置。Stacks是基于Web开发中的绝对定位（absolute positioning）布局模型设计的。

* Container：Container可以让您创建的矩形视觉元素。container可以装饰一个BoxDecoration，如background、一个边框、或者一个阴影。Container也可以具有边距（margins）、填充（padding）和应用于其大小的约束（constraints）.另外Container可以使用矩阵在三维空间中对其进行变换。


*/
