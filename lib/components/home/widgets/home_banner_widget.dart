
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:luckin_coffee_demo/common/widgets/cache_net_work_img/network_image.dart' as net;
import 'package:luckin_coffee_demo/models/models.dart';

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
                if (state is HomeInitial)
                  // return Image(image: net.NetworkImage(state.default_banner_bg),fit: BoxFit.fill,);
                  return Image.asset(
                    state.default_banner_bg,
                    fit: BoxFit.fill,
                  );
                else if (state is RefreshBanner) return Container();
                return Container();
              },
            ),
          ),
          //region 扫描按钮
          Positioned(
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
          )
          //endregion
        ],
      );
}
