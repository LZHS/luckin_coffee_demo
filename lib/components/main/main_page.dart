import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:luckin_coffee_demo/models/bloc/bloc.dart';

class MainPage extends StatelessWidget {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppColors.appBackColor,
        child: BlocProvider<HomeBloc>.value(
          value: HomeBloc(context),
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              fixedColor: AppColors.appBarColor,
              iconSize: 49.0,
              currentIndex: _currentIndex,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {},
              items: _buildBottomNavItems(),
            ),
          ),
        ));
  }

  _buildBottomNavItems() => [
        BottomNavigationBarItem(
          icon: _buildBarIcon(
            "lib/assets/images/navigatioinBar/icon_home_page.png",
          ),
          activeIcon: _buildBarIcon(
            "lib/assets/images/navigatioinBar/icon_home_page_down.png",
          ),
          title: Text("首页"),
        ),
        BottomNavigationBarItem(
          icon: _buildBarIcon(
            "lib/assets/images/navigatioinBar/icon_men.png",
          ),
          activeIcon: _buildBarIcon(
            "lib/assets/images/navigatioinBar/icon_men_down.png",
          ),
          title: Text("菜单"),
        ),
        BottomNavigationBarItem(
          icon: _buildBarIcon(
            "lib/assets/images/navigatioinBar/icon_order.png",
          ),
          activeIcon: _buildBarIcon(
            "lib/assets/images/navigatioinBar/icon_order_down.png",
          ),
          title: Text("订单"),
        ),
        BottomNavigationBarItem(
          icon: _buildBarIcon(
            "lib/assets/images/navigatioinBar/icon_shopping.png",
          ),
          activeIcon: _buildBarIcon(
            "lib/assets/images/navigatioinBar/icon_shopping_down.png",
          ),
          title: Text("购物车"),
        ),
        BottomNavigationBarItem(
          icon: _buildBarIcon(
            "lib/assets/images/navigatioinBar/icon_persion_center.png",
          ),
          activeIcon: _buildBarIcon(
            "lib/assets/images/navigatioinBar/icon_persion_center_down.png",
          ),
          title: Text("我的"),
        ),
      ];

  _buildBarIcon(name) => Image.asset(
        name,
        width: 22.0,
        height: 27.0,
        fit: BoxFit.scaleDown,
      );
}
