import 'dart:io';

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
            _buildBannerWidget(context),
            _buildMenusWidget(),
          ],
        ),
      ),
    );
  }

  /// 创建 Banner 块的
  _buildBannerWidget(context) =>
      Stack(
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
                    fit: BoxFit.fill,
                  );
                else if (state is RefreshBanner) return Container();
                return Container();
              },
            ),
          ),
          _buildScanWidget(context)
        ],
      );

  _buildScanWidget(context) =>
      Positioned(
        top: 30.0,
        right: 10.0,
        child: GestureDetector(
          onTap: () {
            // Routes.goScanPage(context)
            // LoadingDialog.show(context);
            //
            // Future.delayed(
            //   Duration(seconds: 20),
            // ).whenComplete(() {
            //   LoadingDialog.cancel(context);
            // });

            InternetAddress.lookup("baidu.com").then((value) {
              log.d("$value");
            }).catchError((Object  exception) {
              log.d("message - $exception");
            });
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

  _buildMenusWidget() => Column(
        children: [
          _buildMenusItemWidget("现在下单", "ORDER NOW",
              "lib/assets/images/home/icon_coffee_cup.png", coffeeCup()),
          DividerWidget(left: 20.0, right: 20.0),
          _buildMenusItemWidget("咖啡钱包", "COFFRR WALLET",
              "lib/assets/images/home/icon_coffee_wallet.png", coffeeWallet()),
          DividerWidget(left: 20.0, right: 20.0),
          _buildMenusItemWidget("送Ta咖啡", "SEND COFFEE",
              "lib/assets/images/home/icon_coffee_gift.png", coffeeGift()),
          DividerWidget(left: 20.0, right: 20.0),
          _buildMenusItemWidget(
              "企业账户",
              "SENTERPRISE ACCOUNT",
              "lib/assets/images/home/icon_coffee_account.png",
              coffeeAccount()),
        ],
      );

  _buildMenusItemWidget(
          String title, String subTitle, String iconPath, VoidCallback onTap) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 70.0,
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: AppColors.appTitleColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      subTitle,
                      style: TextStyle(
                          color: AppColors.appSubTitleColor, fontSize: 11),
                    ),
                  )
                ],
              ),
              Container(
                width: 40.0,
                height: 40.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: AppColors.appHomeMenusBorderColor),
                ),
                child: Image.asset(
                  iconPath,
                  width: 24.0,
                  height: 24.0,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ],
          ),
        ),
      );

  coffeeCup() {}

  coffeeWallet() {}

  coffeeGift() {}

  coffeeAccount() {}
}
