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

import 'bottom_navigation_widget.dart';

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
      child: BlocProvider<MainCubit>(
        create: (context) => MainCubit(context),
        child: BlocBuilder<MainCubit, MainState>(
          buildWhen: (_, state) => state is MainCurrentState,
          builder: (context, state) {
            var currentIndex = 0;
            if (state is MainCurrentState) currentIndex = state.currentIndex;
            return Scaffold(
              appBar: _buildCurrentAppBar(currentIndex),
              bottomNavigationBar:
                  BottomNavigationWidget.getBottomNavigationBar(
                onTap: (index) =>
                    context.read<MainCubit>().changeCurrentPage(index),
                currentIndex: currentIndex,
              ),
              body: IndexedStack(
                index: currentIndex,
                children: _children,
              ),
            );
          },
        ),
      ),
    );
  }

  _buildCurrentAppBar(int currentIndex) {
    PreferredSizeWidget appBar;
    if (currentIndex == 1)
      appBar = AppBarCustom(title: "选择咖啡和小食", leftIsNull: true);
    else if (currentIndex == 2)
      appBar = AppBarCustom(title: "订单列表", leftIsNull: true);
    else if (currentIndex == 3)
      appBar = AppBarCustom(title: "购物车", leftIsNull: true);
    return appBar;
  }
}
