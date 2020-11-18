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
              selectedItemColor: AppColors.appMunTextColor,
              selectedFontSize: 11.0,
              unselectedFontSize: 10.0,
              currentIndex: _getCurrentIndex(state),
              type: BottomNavigationBarType.fixed,
              onTap: (index) =>
                  context.bloc<MainCubit>().changeCurrentPage(index),
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

    /// 首页
        BottomNavigationBarItem(
          icon: _buildImage(
            "lib/assets/images/navigatioinBar/icon_home_page.png",
            width: 22.0,
            height: 27.0,
          ),
          activeIcon: _buildImage(
            "lib/assets/images/navigatioinBar/icon_home_page_down.png",
            width: 22.0,
            height: 27.0,
          ),
          label: "首页",
        ),

        /// 菜单
        BottomNavigationBarItem(
          icon: _buildImage(
            "lib/assets/images/navigatioinBar/icon_men.png",
            width: 20.0,
            height: 26.0,
          ),
          activeIcon: _buildImage(
            "lib/assets/images/navigatioinBar/icon_men_down.png",
            width: 20.0,
            height: 26.0,
          ),
          label: "菜单",
        ),

        /// 订单
        BottomNavigationBarItem(
          icon: _buildImage(
            "lib/assets/images/navigatioinBar/icon_order.png",
            width: 20.0,
            height: 25.0,
          ),
          activeIcon: _buildImage(
            "lib/assets/images/navigatioinBar/icon_order_down.png",
            width: 20.0,
            height: 25.0,
          ),
          label: "订单",
        ),

        /// 购物车
        BottomNavigationBarItem(
          icon: _buildImage(
            "lib/assets/images/navigatioinBar/icon_shopping.png",
            width: 24.0,
            height: 24.0,
          ),
          activeIcon: _buildImage(
            "lib/assets/images/navigatioinBar/icon_shopping_down.png",
            width: 24.0,
            height: 24.0,
          ),
          label: "购物车",
        ),

        /// 我的
        BottomNavigationBarItem(
          icon: _buildImage(
            "lib/assets/images/navigatioinBar/icon_persion_center.png",
            width: 20.0,
            height: 23.0,
          ),
          activeIcon: _buildImage(
            "lib/assets/images/navigatioinBar/icon_persion_center_down.png",
            width: 20.0,
            height: 23.0,
          ),
          label: "我的",
        ),
      ];

  _buildImage(path, {width: 24.0, height: 27.0}) => Container(
        width: 25.0,
        height: 30.0,
        alignment: Alignment.center,
        child: Image.asset(
          path,
          width: width,
          height: height,
          fit: BoxFit.scaleDown,
        ),
      );

  int _getCurrentIndex(state) {
    if (state is MainCurrentState)
      return state.currentIndex;
    else
      return 0;
  }
}
