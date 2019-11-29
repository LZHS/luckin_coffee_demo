import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/common/custom_swiper/custom_swiper.dart';
import 'package:flutter_demo/components/pages/main/menu/beans/product.dart';
import 'package:flutter_demo/config/colors.dart';

/// 菜单页面
class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<ProductInfo> productInfos = List();
  _MenuPageState() {
    rootBundle.loadString("lib/assets/datas/productList.json").then((val) {
      List<ProductList> products = List();
      json
          .decode(val)
          .forEach((item) => products.add(ProductList.fromJson(item)));
      String tempCategoryName = "";
      /// TODO 这里将要绑定数据
      // products.forEach((item) => {
      //       if (item.categoryName != tempCategoryName) {productInfos.add}
      //     });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      child: Column(
        children: <Widget>[
          /// 状态栏
          Container(
            width: double.infinity,
            height: 20.0,
          ),

          /// 标题栏
          Container(
            width: double.infinity,
            height: 44.0,
            alignment: Alignment.center,
            child: Text(
              "选择咖啡和小食",
              style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),

          /// 滑动 Banner
          CustomSwiper(
            [
              "lib/assets/images/banners/icon_banner04.jpg",
              "lib/assets/images/banners/icon_banner05.png",
            ],
            height: 103.0,
          ),

          /// 内容 菜单 已商品详情
          Expanded(
            flex: 1,
            child: Row(),
          )
        ],
      ),
    );
  }
}
