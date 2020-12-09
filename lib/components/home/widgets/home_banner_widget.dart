
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:luckin_coffee_demo/data_provider/beans/banner/banner_bean.dart';
import 'package:luckin_coffee_demo/models/models.dart';

/// 主页面banner 模块 Widget
class HomeBannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
            width: double.infinity,
            height: 203.0,
            child: BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (_, state) =>
                  state is HomeInitial || state is RefreshBanner,
              builder: (_, state) {
                if (state is HomeInitial) {
                  BlocProvider.of<HomeBloc>(context).add(RequestData());
                  return _buildDefaultWidget(HomeInitial.DEFAULT_BANNER_BG);
                } else if (state is RefreshBanner)
                  return state.status == BannerStateEnum.NO_BANNER_DATA
                      ? _buildDefaultWidget(RefreshBanner.DEFAULT_BANNER_BG)
                      : _buildSwiperWidget(state.banners);
                return Container();
              },
            ),
          ),
          _buildScanWidget(context),
        ],
      );

  _buildDefaultWidget(String defaultBannerPath) => Image.asset(
        defaultBannerPath,
        fit: BoxFit.fill,
      );

  _buildSwiperWidget(List<BannerItem> banners) => Container(
        alignment: Alignment.center,
        child: Text("请求到的数据 ${banners.length}"),
      );

  /// 扫描按钮
  _buildScanWidget(context) => Positioned(
        top: 30.0,
        right: 10.0,
        child: GestureDetector(
          onTap: () => context.read<HomeBloc>().clickSan(),
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
