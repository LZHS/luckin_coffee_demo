import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:luckin_coffee_demo/components/components.dart';
import 'package:luckin_coffee_demo/components/menu/menu_page.dart';
import 'package:luckin_coffee_demo/components/order/order_page.dart';
import 'package:luckin_coffee_demo/components/person_center/person_center_page.dart';
import 'package:luckin_coffee_demo/components/shopping/shopping_page.dart';
import 'package:luckin_coffee_demo/models/bloc/bloc.dart';
import 'package:luckin_coffee_demo/models/bloc/main/main_cubit.dart';

class MainPage extends StatelessWidget {
  final List<Widget> _children = [
    HomePage(),
    MenuPage(),
    OrderPage(),
    ShoppingPage(),
    PersonCenterPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.appBackColor,
      child: BlocProvider<MainCubit>.value(
        value: MainCubit(context),
        child: BlocBuilder<MainCubit, MainState>(
          builder: (context, state) => Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              fixedColor: AppColors.appBarColor,
              currentIndex: _getCurrentIndex(state),
              type: BottomNavigationBarType.fixed,
              onTap: (index) =>
                  context.bloc<MainCubit>().emit(MainCurrentState(index)),
              items: _buildBottomNavItems(),
            ),
            body: IndexedStack(
              index: _getCurrentIndex(state),
              children: _children,
            ),
          ),
        ),
      ),
    );
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
      icon: Image.asset(
        "lib/assets/images/navigatioinBar/icon_order.png",
        width: 22.0,
        height: 27.0,
        fit: BoxFit.scaleDown,
      ),
      activeIcon: Image.asset(
        "lib/assets/images/navigatioinBar/icon_order_down.png", width: 22.0,
        height: 27.0,
        fit: BoxFit.scaleDown,
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

  _buildBarIcon(name) =>
      Image.asset(
        name,
        width: 22.0,
        height: 27.0,
        fit: BoxFit.scaleDown,
      );

  int _getCurrentIndex(state) {
    if (state is MainCurrentState)
      return state.currentIndex;
    else
      return 0;
  }
}
