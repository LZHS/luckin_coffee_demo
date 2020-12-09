import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:luckin_coffee_demo/models/bloc/bloc.dart';

// ignore: must_be_immutable
class HomeMenusWidget extends StatelessWidget {
  HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) => BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (_, state) => state is HomeInitial,
      builder: (content, state) {
        homeBloc = BlocProvider.of<HomeBloc>(context);
        HomeInitial currState = (state as HomeInitial);
        return Column(
          children: _buildMenuItems(currState.menuItemData),
        );
      });

  _buildMenuItems(List menuItemData) => menuItemData
      .map((element) => _buildMenusItemWidget(
            element["title"],
            element["subTitles"],
            element["icon"],
            element["id"],
          ))
      .toList();

  GestureDetector _buildMenusItemWidget(
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



}
