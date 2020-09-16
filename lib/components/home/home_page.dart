import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:luckin_coffee_demo/common/common.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildBannerWidget(),
        ],
      ),
    );
  }

  _buildBannerWidget() => Stack(
        children: [
          Container(
            width: double.infinity,
            height: 203.0,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.yellow)
            ),
            child: Text("123123"),
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
