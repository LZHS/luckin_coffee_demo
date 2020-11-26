import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common.dart';

class BottomNavigationWidget {
  //region BottomNavigationBarItem 列表
  static List<BottomNavigationBarItem> _bottomNavItems = [
    /// 首页
    BottomNavigationBarItem(
        icon: _buildImage("lib/assets/images/navigatioinBar/icon_home_page.png",
            width: 22.0, height: 27.0),
        activeIcon: _buildImage(
            "lib/assets/images/navigatioinBar/icon_home_page_down.png",
            width: 22.0,
            height: 27.0),
        label: "首页"),

    /// 菜单
    BottomNavigationBarItem(
        icon: _buildImage("lib/assets/images/navigatioinBar/icon_men.png",
            width: 20.0, height: 26.0),
        activeIcon: _buildImage(
            "lib/assets/images/navigatioinBar/icon_men_down.png",
            width: 20.0,
            height: 26.0),
        label: "菜单"),

    /// 订单
    BottomNavigationBarItem(
        icon: _buildImage("lib/assets/images/navigatioinBar/icon_order.png",
            width: 20.0, height: 25.0),
        activeIcon: _buildImage(
            "lib/assets/images/navigatioinBar/icon_order_down.png",
            width: 20.0,
            height: 25.0),
        label: "订单"),

    /// 购物车
    BottomNavigationBarItem(
        icon: _buildImage("lib/assets/images/navigatioinBar/icon_shopping.png",
            width: 24.0, height: 24.0),
        activeIcon: _buildImage(
            "lib/assets/images/navigatioinBar/icon_shopping_down.png",
            width: 24.0,
            height: 24.0),
        label: "购物车"),

    /// 我的
    BottomNavigationBarItem(
        icon: _buildImage(
            "lib/assets/images/navigatioinBar/icon_persion_center.png",
            width: 20.0,
            height: 23.0),
        activeIcon: _buildImage(
            "lib/assets/images/navigatioinBar/icon_persion_center_down.png",
            width: 20.0,
            height: 23.0),
        label: "我的")
  ];

  static _buildImage(path, {width: 24.0, height: 27.0}) => Container(
        width: 25.0,
        height: 30.0,
        alignment: Alignment.center,
        child: Image.asset(path,
            width: width, height: height, fit: BoxFit.scaleDown),
      );

//endregion

  /// 获取一个 BottomNavigationBar 对象
  static BottomNavigationBar getBottomNavigationBar({
    @required ValueChanged<int> onTap,
    @required int currentIndex,
  }) =>
      BottomNavigationBar(
          selectedItemColor: AppColors.appMunTextColor,
          selectedFontSize: 11.0,
          unselectedFontSize: 10.0,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: onTap,
          items: _bottomNavItems);
}
