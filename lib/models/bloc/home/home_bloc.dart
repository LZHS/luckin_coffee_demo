import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:luckin_coffee_demo/data_provider/data_provider.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BuildContext context;
  SwiperController _topBannerController;

  HomeBloc(this.context)
      : assert(context != null),
        super(HomeInitial()) {
    Future.delayed(
      Duration(seconds: 10),
      () => add(RefreshLocating()),
    );
  }

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is RequestData)
      yield* _requestHomeData();
    else if (event is RefreshMenu)
      yield RefreshMenuBottom();
    else if (event is RefreshLocating)
      yield LocatingRefresh(LocatingInformation(
          storeName: "青年汇店", distance: "1.3公里", isTakeTheir: false));
  }
/// 请求 Banner 事件
  Stream<HomeState> _requestHomeData() async* {
    try{
      LoadingDialog.show(context);
      HomeService service = HomeServiceImp();
      final BaseEntity data = await service.getHomeTopBannerData().catchError((
          onError) => onError);
      if (data.code == 0) {
        List<BannerItem> banners = data.result;
        RefreshBanner refreshBanner = RefreshBanner();
        refreshBanner.status = banners.length <= 0
            ? BannerStateEnum.NO_BANNER_DATA
            : BannerStateEnum.SHOW_BANNER_DATA;
        refreshBanner.banners = banners;
        yield refreshBanner;
      } else
        showToast(data.message);
    } catch (e) {
      log.e(e.toString());
    } finally {
      LoadingDialog.cancel();
    }
  }

  ///点击了扫描按钮
  onClickScan() {
    showToast("你点击了扫描页面");
  }

  ///
  onClickMenuItem(int type) {
    log.d("menuItemClick(type:$type) = HomeBloc");
    add(RequestData());
  }

  /// 底部 Banner 点击事件
  onClickMenuBottomItem() {
    log.d("底部 Banner 点击事件");
  }

  ///BannerItem 被点击
  onClickBannerItem(BannerItem item) {
    log.d("BannerItem 被点击 ：${item.toString()}");
    _topBannerController.stopAutoplay();
    Future.delayed(Duration(minutes: 1), () {
      _topBannerController.startAutoplay();
    });
  }

  /// 用户点击 是否自提 Item
  onClickLocating() {
    Routes.goLoginPage(context);
  }

  set topBannerController(SwiperController value) {
    _topBannerController = value;
  }
}
