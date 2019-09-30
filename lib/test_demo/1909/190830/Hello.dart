import 'package:flutter/material.dart';

class Hello extends Center {
  @override 
  Widget get child =>
      new Text("Hello World !", textDirection: TextDirection.ltr);
}
/**
 该runAPP函数接受给定的Widget并使其成为 widget树的根。在此示例中，widget树由两个widget:Center(以及其子widget)和Text组成。框架强制根widget覆盖整个屏幕，这一位置文本“Hello World！”会居中显示在屏幕上，文本显示的方向需要在Text实例中指定，当使用MaterialAPP时，文本的方向将自动设定，稍后将进行演示。





 */
