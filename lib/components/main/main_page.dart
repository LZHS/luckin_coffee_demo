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
      child: BlocProvider<MainCubit>.value(
        value: MainCubit(context),
        child: BlocBuilder<MainCubit, MainState>(
          builder: (context, state) => Scaffold(
            bottomNavigationBar: BottomNavigationWidget.getBottomNavigationBar(
              onTap: (index) =>
                  context.read<MainCubit>().changeCurrentPage(index),
              currentIndex: _getCurrentIndex(state),
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


  int _getCurrentIndex(state) {
    if (state is MainCurrentState)
      return state.currentIndex;
    else
      return 0;
  }
}
