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
    if (event is RequestData){
      LoadingDialog.show(context);
      yield* _requestHomeData();
    }else
    if (event is RefreshMenu) yield RefreshMenuBottom();
    if (event is RefreshLocating)
      yield LocatingRefresh(LocatingInformation(
          storeName: "青年汇店", distance: "1.3公里", isTakeTheir: false));
  }

  Stream<HomeState> _requestHomeData() async* {
    HomeService service = HomeServiceImp();

   final BaseEntity data=await service.getHomeData().catchError((data) {
      showToast("数据请求失败${data.message}");
      return data;
    }).whenComplete(() {
      log.d("whenComplete");
    });
    if (data.result is List<BannerItem>)
      yield RefreshBanner(data.result);
    else
      showToast("数据请求失败");
    LoadingDialog.cancel();
  }

  clickSan() {
    showToast("你点击了扫描页面");
  }

  menuItemClick(int type) {
    log.d("menuItemClick(type:$type) = HomeBloc");
  }
}
