import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:luckin_coffee_demo/models/bloc/bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(context),
        child: Column(
          children: [
            _buildBannerWidget(),
          ],
        ),
      ),
    );
  }

  /// 创建 Banner 块的
  _buildBannerWidget() => Stack(
        children: [
          Container(
            width: double.infinity,
            height: 203.0,
            child: BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (_, state) =>
                  state is HomeInitial || state is RefreshBanner,
              builder: (_, state) {
                if (state is HomeInitial)
                  return Image.asset(
                    "lib/assets/images/banners/icon_banner01.jpg",
                    width: double.infinity,
                    height: 203.0,
                    fit: BoxFit.scaleDown,
                  );
                else if (state is RefreshBanner) return Container();
                return Container();
              },
            ),
          ),
          _buildScanWidget()
        ],
      );

  _buildScanWidget() => Positioned(
        top: 30.0,
        right: 10.0,
        child: GestureDetector(
          onTap: () {
            log.d("跳转只扫描页面，");
          },
          child: Container(
            width: 40.0,
            height: 40.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.appScanBackgroundColor,
                borderRadius: BorderRadius.circular(20.0)),
            child: Image.asset(
              "lib/assets/images/home/icon_scanning.png",
              width: 24.0,
              height: 20.0,
            ),
          ),
        ),
      );
}
