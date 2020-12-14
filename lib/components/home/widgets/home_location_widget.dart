import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:luckin_coffee_demo/data_provider/data_provider.dart';
import 'package:luckin_coffee_demo/models/bloc/home/home_bloc.dart';

/// 主页面 显示用户是否自提的 Widget
// ignore: must_be_immutable
class HomeLocationWidget extends StatelessWidget {
  HomeBloc _bloc;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<HomeBloc, HomeState>(buildWhen: (previous, state) {
        return state is LocatingRefresh;
      }, builder: (content, state) {
        _bloc = BlocProvider.of<HomeBloc>(context);
        if (state is LocatingRefresh)
          return _buildLocatingWidget(state.locatingInformation);
        return Container();
      });

  _buildLocatingWidget(LocatingInformation locating) => GestureDetector(
        onTap: () => _bloc.onClickLocating(),
        child: Container(
          width: double.infinity,
          height: 65.0,
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: AppColors.appDividerColor, width: 1)),
          ),
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
        ),
      );
}
