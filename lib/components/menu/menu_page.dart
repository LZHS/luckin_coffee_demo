import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luckin_coffee_demo/models/models.dart';

///选择咖啡和小食 页面
///
///[_buildMenuBannerWidget]
///
///[MenuContentWidget]
class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuBloc(context),
      child: Column(
        children: [
          _buildMenuBannerWidget(),
          Expanded(child: MenuContentWidget())
        ],
      ),
    );
  }

  ///  构建顶部Banner 控件 ，如果 数据为空则不显示
  _buildMenuBannerWidget() =>
      BlocBuilder<MenuBloc, MenuState>(builder: (_, state) {
        return Container();
      });
}
///选择咖啡和小食 内容控件
///显示 商品 列表
class MenuContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
