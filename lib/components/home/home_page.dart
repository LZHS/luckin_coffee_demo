import 'package:flutter/material.dart';
import 'package:flutter_demo/components/home/beans/tab_info.dart';

class HomePage extends StatefulWidget {
  final String msg;
  HomePage({@required this.msg});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int currentIndex = 0;
  var tabInfos = [
    TabInfo(
      "首页",
      "lib/assets/images/navigatioinBar/icon_home_page.png",
      "lib/assets/images/navigatioinBar/icon_home_page_down.png",
    ),
    TabInfo(
      "菜单",
      "lib/assets/images/navigatioinBar/icon_men.png",
      "lib/assets/images/navigatioinBar/icon_men_down.png",
    ),
    TabInfo(
      "订单",
      "lib/assets/images/navigatioinBar/icon_order.png",
      "lib/assets/images/navigatioinBar/icon_order_down.png",
    ),
    TabInfo(
      "购物车",
      "lib/assets/images/navigatioinBar/icon_shopping.png",
      "lib/assets/images/navigatioinBar/icon_shopping_down.png",
    ),
    TabInfo(
      "我的",
      "lib/assets/images/navigatioinBar/icon_persion_center.png",
      "lib/assets/images/navigatioinBar/icon_persion_center_down.png",
    ),
  ];

  _HomePageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0x64f8f8f8),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0x64f8f8f8),
        type: BottomNavigationBarType.fixed,
        items: createMenuItem(),
        currentIndex: currentIndex,
        iconSize: 24.0,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }

  List<BottomNavigationBarItem> createMenuItem() {
    List<BottomNavigationBarItem> navigationItems = [];
    for (var i = 0; i < tabInfos.length; i++) {
      navigationItems.add(
        BottomNavigationBarItem(
          icon: getTabIcon(i),
          title: Text(
            tabInfos[i].title,
            style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
                color: Color(0xff2b4c7e)),
          ),
        ),
      );
    }
    return navigationItems;
  }

  getTabIcon(int tabIndex) {
    Image createTabImage(String imgPath) => Image.asset(
          imgPath,
          width: 22.0,
          height: 27.0,
        );
    if (tabIndex == currentIndex)
      return createTabImage(tabInfos[tabIndex].imgDown);
    else
      return createTabImage(tabInfos[tabIndex].img);
  }
}
