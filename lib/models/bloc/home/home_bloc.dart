import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:luckin_coffee_demo/data_provider/data_provider.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BuildContext context;

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

  Stream<HomeState> _requestHomeData() async* {
    try{
      LoadingDialog.show(context);
      HomeService service = HomeServiceImp();
      final BaseEntity data = await service.getHomeData().catchError((onError)=>onError);
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
    }catch(e){
      log.e(e.toString());
    }finally{
      LoadingDialog.cancel();
    }
  }

  clickSan() {
    showToast("你点击了扫描页面");
  }

  menuItemClick(int type) {
    log.d("menuItemClick(type:$type) = HomeBloc");
    add(RequestData());
  }
  menuButtomItemClick() {
    log.d("底部 Banner 点击事件");
  }
}
