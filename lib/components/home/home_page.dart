import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:luckin_coffee_demo/models/bloc/bloc.dart';

import 'widgets/home_banner_widget.dart';
import 'widgets/home_menus_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(context),
        child: Column(
          children: [
            HomeBannerWidget(),
            HomeMenusWidget(),
          ],
        ),
      ),
    );
  }
}
