import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/common/common_utils.dart';
import 'package:flutter_demo/common/custom_swiper/custom_swiper.dart';
import 'package:flutter_demo/components/pages/main/menu/beans/product.dart';
import 'package:flutter_demo/config/colors.dart';

/// 菜单页面
class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<ProductList> products = List();
  List<ProductInfo> productInfos = List();
  var controller = new ScrollController();
  _MenuPageState() {
    rootBundle.loadString("lib/assets/datas/productList.json").then((val) {
      List<ProductList> tempProducts = List();
      List<ProductInfo> tempProductInfos = List();
      json
          .decode(val)
          .forEach((item) => tempProducts.add(ProductList.fromJson(item)));
      tempProducts.forEach((item) {
        tempProductInfos.add(ProductInfo(
          isCategory: true,
          category: item.categoryName,
          categoryInfo: item.info,
        ));
        item.productInfo
            .forEach((productInfo) => tempProductInfos.add(productInfo));
      });

      setState(() {
        this.products
          ..clear()
          ..addAll(tempProducts);
        this.productInfos
          ..clear()
          ..addAll(tempProductInfos);
        tempProductInfos.clear();
        tempProducts.clear();
      });
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
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 24,
                  child: Stack(
                    children: <Widget>[
                      createCategoryList(),
                    ],
                  ),
                ),
                Expanded(
                  flex: 76,
                  child: createProductList(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  ListView createProductList() {
    return ListView.builder(
      itemCount: productInfos.length,
      padding: EdgeInsets.all(0.0),
      itemBuilder: (BuildContext context, int index) =>
          createProductItem(context, index),
    );
  }

  Widget createProductItem(BuildContext context, int index) {
    if (productInfos.elementAt(index).isCategory)
      return createItemTitle(context, index);
    else
      return createItemContent(context, index);
  }

  /// 创建 Item 内容视图
  Widget createItemContent(BuildContext context, int index) {
    ProductInfo product = productInfos.elementAt(index);
    bool isShowDivider = false;
    if (index < productInfos.length)
      isShowDivider = !productInfos.elementAt(index + 1).isCategory;
    return Container(
      height: isShowDivider ? 91.0 : 90.0,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  /// TODO 创建 图片中的 满减优惠
                  Image(
                    image: AssetImage(product.img),
                    width: 70.0,
                    height: 70.0,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 11.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        product.name,
                        style: TextStyle(
                          color: Color(0xff383838),
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                      Text(
                        product.describe,
                        style: TextStyle(
                          color: Color(0xffa6a6a6),
                          fontSize: 11.0,
                        ),
                      ),
                      Text(
                        product.specifications,
                        style: TextStyle(
                          color: Color(0xffa6a6a6),
                          fontSize: 11.0,
                        ),
                      ),
                      Text(
                        "￥ ${product.unitPrice}",
                        style: TextStyle(
                          color: Color(0xff383838),
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.all(3.0),
                child: Image(
                  image: AssetImage("lib/assets/images/menu/icon_add.png"),
                  width: 22.0,
                  height: 22.0,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
          Container(
            width: double.infinity,
            height: isShowDivider ? 1.0 : 0.0,
            decoration: BoxDecoration(
              color: Color(0xfff2f2f2),
            ),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  ///创建 Item title 控件
  Widget createItemTitle(BuildContext context, int index) {
    ProductInfo product = productInfos.elementAt(index);
    return Container(
      height: 44.0,
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            product.category,
            style: TextStyle(
              fontSize: 13.0,
              color: Color(0xff383838),
            ),
          ),
          product.categoryInfo.length > 0
              ? Text(
                  product.categoryInfo,
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Color(0xffa6a6a6),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  ListView createCategoryList() {
    return ListView.builder(
      itemCount: products.length,
      itemExtent: 44.0,
      padding: EdgeInsets.all(0.0),
      itemBuilder: (BuildContext context, int index) =>
          createCategoryItem(context, index),
      controller: controller,
    );
  }

  Widget createCategoryItem(BuildContext context, int index) {
    return Material(
      child: Ink(
        child: InkWell(
          onTap: () {
            Log.d("你点击了 ${products.elementAt(index).categoryName}");
            this.controller.animateTo(
                  100.0,
                  duration: new Duration(milliseconds: 300), // 300ms
                  curve: Curves.bounceIn, // 动画方式
                );
          },
          child: Container(
            width: double.infinity,
            height: 44.0,
            alignment: Alignment.center,
            child: Text(
              products.elementAt(index).categoryName,
              style: TextStyle(
                fontSize: 14.0,
                color: Color(0xff505050),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
