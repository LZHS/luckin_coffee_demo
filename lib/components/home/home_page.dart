import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:luckin_coffee_demo/models/bloc/bloc.dart';

import 'widgets/home_banner_widget.dart';
import 'widgets/home_location_widget.dart';
import 'widgets/home_menu_bottom_widget.dart';
import 'widgets/home_menus_widget.dart';

/// 应用 主页面
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
     super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeBloc(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeBannerWidget(),
              HomeLocationWidget(),
              HomeMenusWidget(),
              HomeMenuBottomWidget(),
            ],
          ),
        ));
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }
}
