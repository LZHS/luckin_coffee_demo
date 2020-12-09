import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/models/bloc/bloc.dart';

/// Home 主页面 底部Bottom
// ignore: must_be_immutable
class HomeMenuBottomWidget extends StatelessWidget {
  HomeBloc _bloc;

  @override
  Widget build(BuildContext context) => BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (_, state) =>
          state is HomeInitial || state is RefreshMenuBottom,
      builder: (context, state) {
        _bloc = BlocProvider.of<HomeBloc>(context);
        if (state is HomeInitial)
          return _buildMenuBottomWidget(HomeInitial.DEFAULT_BOTTOM_BANNER_BG);
        return Container();
      });

  _buildMenuBottomWidget(String bottomBarPath) => GestureDetector(
        onTap: () => _bloc.menuButtomItemClick(),
        child: Container(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Image.asset(
            bottomBarPath,
            width: double.infinity,
            height: 55.0,
            fit: BoxFit.fill,
          ),
        ),
      );
}
