import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:luckin_coffee_demo/data_provider/manager/beans/locating_information.dart';
import 'package:luckin_coffee_demo/models/bloc/bloc.dart';

// ignore: must_be_immutable
class HomeMenusWidget extends StatelessWidget {
  HomeBloc homeBloc;

  List<Widget> menuItems = [];

  @override
  Widget build(BuildContext context) => BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (_, state) =>
          state is HomeInitial ||
          state is RefreshMenuBottom ||
          state is LocatingRefresh,
      builder: (content, state) {
        homeBloc = context.read();
        if (state is HomeInitial) _buildMenuItems(state.menuItemData);
        if (state is RefreshMenuBottom) _buildMenuBottom(state);
        if (state is LocatingRefresh) _buildLocating(state);
        return Column(
          children: menuItems,
        );
      });

  _buildMenuItems(menuItemData) =>
      menuItemData.forEach((element) => menuItems.add(
            _buildMenusItemWidget(
              element["title"],
              element["subTitles"],
              element["icon"],
              element["id"],
            ),
          ));

  _buildMenusItemWidget(
    String title,
    String subTitle,
    String iconPath,
    int type,
  ) =>
      GestureDetector(
        onTap: () => menuItemClick(type),
        child: Container(
          width: double.infinity,
          height: 70.0,
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          decoration: BoxDecoration(
              border: Border(
                  bottom: type != 3
                      ? BorderSide(color: AppColors.appDividerColor, width: 1)
                      : BorderSide.none)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: AppColors.appTitleColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      subTitle,
                      style: TextStyle(
                          color: AppColors.appSubTitleColor, fontSize: 11),
                    ),
                  )
                ],
              ),
              Container(
                width: 40.0,
                height: 40.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: AppColors.appHomeMenusBorderColor),
                ),
                child: Image.asset(
                  iconPath,
                  width: 24.0,
                  height: 24.0,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ],
          ),
        ),
      );

  menuItemClick(int type) => homeBloc.menuItemClick(type);

  void _buildMenuBottom(RefreshMenuBottom state) {
    menuItems.add(_buildMenuBottomWidget(state.bottomBarPath));
  }

  _buildMenuBottomWidget(String bottomBarPath) => GestureDetector(
        onTap: () => menuItemClick(-1),
        child: Container(
          width: double.infinity,
          height: 55.0,
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Image.asset(bottomBarPath),
        ),
      );

  _buildLocating(LocatingRefresh state) {
    menuItems.insert(0, _buildLocatingWidget(state.locatingInformation));
  }

  _buildLocatingWidget(LocatingInformation locating) => Container(
        width: double.infinity,
        height: 65.0,
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        decoration: BoxDecoration(
            border: Border(
                bottom:
                    BorderSide(color: AppColors.appDividerColor, width: 1))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  locating.storeName,
                  style: TextStyle(
                    color: AppColors.appTitleColor,
                    fontSize: 15,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    "距您${locating.distance}",
                    style: TextStyle(
                        color: AppColors.appSubTitleColor, fontSize: 11),
                  ),
                )
              ],
            ),
            Container(
              width: 40.0,
              height: 40.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: AppColors.appHomeMenusBorderColor),
              ),
            ),
          ],
        ),
      );
}
