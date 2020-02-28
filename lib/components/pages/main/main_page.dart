import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/components/pages/main/beans/tab_info.dart';
import 'package:luckin_coffee_demo/components/pages/main/home/home_page.dart';
import 'package:luckin_coffee_demo/components/pages/main/menu/menu_page.dart';
import 'package:luckin_coffee_demo/components/pages/main/order/order_page.dart';
import 'package:luckin_coffee_demo/components/pages/main/persion_center/persion_center_page.dart';
import 'package:luckin_coffee_demo/components/pages/main/shopping/shopping_page.dart';
import 'package:luckin_coffee_demo/config/res/colors.dart';

/// ```
/// 主页面
/// ```
class MainPage extends StatefulWidget {
  final String msg;
  MainPage({@required this.msg});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  int currentIndex = 0;
  final List<TabInfo> _tabInfos = List();
  final List _pages = List();
  var _pageController = PageController(initialPage: 0);
  _MainPageState() {
    _tabInfos
      ..add(
        TabInfo(
          "首页",
          "lib/assets/images/navigatioinBar/icon_home_page.png",
          "lib/assets/images/navigatioinBar/icon_home_page_down.png",
        ),
      )
      ..add(
        TabInfo(
          "菜单",
          "lib/assets/images/navigatioinBar/icon_men.png",
          "lib/assets/images/navigatioinBar/icon_men_down.png",
        ),
      )
      ..add(
        TabInfo(
          "订单",
          "lib/assets/images/navigatioinBar/icon_order.png",
          "lib/assets/images/navigatioinBar/icon_order_down.png",
        ),
      )
      ..add(
        TabInfo(
          "购物车",
          "lib/assets/images/navigatioinBar/icon_shopping.png",
          "lib/assets/images/navigatioinBar/icon_shopping_down.png",
        ),
      )
      ..add(
        TabInfo(
          "我的",
          "lib/assets/images/navigatioinBar/icon_persion_center.png",
          "lib/assets/images/navigatioinBar/icon_persion_center_down.png",
        ),
      );
    _pages
      ..add(HomePage())
      ..add(MenuPage())
      ..add(OrderPage())
      ..add(ShoppingPage())
      ..add(PersionCenterPage());
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body:  PageView.builder(
          itemCount: _pages.length,
          itemBuilder: (BuildContext context, int indext) =>
              _pages.elementAt(indext),
          controller: _pageController,
          onPageChanged: (int indxt) {
            setState(() {
              this.currentIndex = indxt;
            });
          }, 
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: backgroundColor,
        type: BottomNavigationBarType.fixed,
        items: createMenuItem(),
        currentIndex: currentIndex,
        iconSize: 20.0,
        onTap: (index) {
          setState(() {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          });
        },
      ),
    );
  }

  List<BottomNavigationBarItem> createMenuItem() {
    List<BottomNavigationBarItem> navigationItems = [];
    for (var i = 0; i < _tabInfos.length; i++) {
      navigationItems.add(
        BottomNavigationBarItem(
          icon: getTabIcon(i),
          title: Text(
            _tabInfos[i].title,
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
      return createTabImage(_tabInfos[tabIndex].imgDown);
    else
      return createTabImage(_tabInfos[tabIndex].img);
  }
}
