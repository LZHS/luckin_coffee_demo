
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:luckin_coffee_demo/data_provider/data_provider.dart';
import 'package:luckin_coffee_demo/models/models.dart';

/// 主页面banner 模块 Widget
// ignore: must_be_immutable
class HomeBannerWidget extends StatelessWidget {
  HomeBloc _bloc;
  final double width = double.infinity, height = 203.0;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
            constraints: BoxConstraints(minHeight: height, minWidth: width),
            child: BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (_, state) =>
                  state is HomeInitial || state is RefreshBanner,
              builder: (context, state) {
                _bloc = BlocProvider.of<HomeBloc>(context);
                if (state is HomeInitial) {
                  _bloc.add(RequestData());
                  return _buildDefaultWidget(HomeInitial.DEFAULT_BANNER_BG);
                } else if (state is RefreshBanner)
                  return state.status == BannerStateEnum.NO_BANNER_DATA
                      ? _buildDefaultWidget(RefreshBanner.DEFAULT_BANNER_BG)
                      : _buildSwiperWidget(state.banners);
                return Container();
              },
            ),
          ),
          _buildScanWidget(),
        ],
      );

  _buildDefaultWidget(String defaultBannerPath) => Image.asset(
        defaultBannerPath,
        fit: BoxFit.fill,
      );

  Container _buildSwiperWidget(List<BannerItem> banners) {
    var _controller = SwiperController();
    _bloc.topBannerController = _controller;
    return Container(
      height: height,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image(
              image: NetworkCacheImage(
                  BASE_URL + banners.elementAt(index).imgPath),
              fit: BoxFit.fill);
        },
        autoplay: true,
        duration: 1000,
        itemCount: banners.length,
        onTap: (index) => _bannerOnTap(banners.elementAt(index)),
        controller: _controller,
        pagination: SwiperPagination(
          margin: const EdgeInsets.all(8.0),
          builder: DotSwiperPaginationBuilder(
              size: 9.0,
              space: 3.0,
              color: Colors.white,
              activeColor: AppColors.appTheme90c0ef),
        ),
      ),
    );
  }

  /// 扫描按钮
  _buildScanWidget() => Positioned(
        top: 30.0,
        right: 10.0,
        child: GestureDetector(
          onTap: () => _bloc.clickSan(),
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

  /// Banner Item 被点击是触发
  _bannerOnTap(BannerItem item) {
    _bloc.bannerItemClick(item);
  }
}
