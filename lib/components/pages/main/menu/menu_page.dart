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

class _MenuPageState extends State<MenuPage> with TickerProviderStateMixin{
  /// 页面原始数据
  List originalData = List();

  List<ProductList> products = List();
  List<ProductInfo> productInfos = List();

  ScrollController _categoryController = new ScrollController(
    keepScrollOffset: false,
  );
  ScrollController _productsController = new ScrollController();
  bool isCheckOrScroll = false;

  AnimationController _animationController;
 Animation _animation;
  _MenuPageState() {
    _initData();
    _initEvent();
  }

  @override
  void dispose() {
    super.dispose();
    _categoryController.dispose();
    _productsController.dispose();
  }

  @override
  void initState() {
    super.initState();
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
                color: Colors.black,
              ),
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
                  flex: 6,
                  child: Stack(
                    children: <Widget>[
                      createCategoryAnimat(),
                      createCategoryList(),
                    ],
                  ),
                ),
                Expanded(
                  flex: 19,
                  child: createProductList(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// 初始化测试数据
  _initData() {
    rootBundle.loadString("lib/assets/datas/productList.json").then((val) {
      List<ProductList> tempProducts = List();
      List<ProductInfo> tempProductInfos = List();
      originalData.clear();
      originalData = json.decode(val);
      originalData
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

  /// 设置 ListView 滚动 监听
  _initEvent() {
    _productsController.addListener(
      () {
        Log.d("offset = ${_productsController.offset}");
      },
    );
    _animationController=AnimationController(duration: const  Duration(seconds: 1),vsync: this);
    _animation= CurveTween(curve:  Curves.linear).animate(_animationController);
  }

  /// 创建产品 列表
  ListView createProductList() {
    return ListView.builder(
      itemCount: productInfos.length,
      padding: EdgeInsets.all(0.0),
      itemBuilder: (BuildContext context, int index) =>
          createProductItem(context, index),
      controller: _productsController,
    );
  }

  /// 按需创建 产品 Item
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
    if (index < productInfos.length - 1)
      isShowDivider = !productInfos.elementAt(index + 1).isCategory;
    return Material(
      color: Colors.white,
      child: Ink(
        child: InkWell(
          onTap: () {
            Log.d("你点击了 ${product.name}");
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                height: 90.0,
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                child: Row(
                  children: <Widget>[
                    createItemImage(product),
                    createItemCenterText(product),
                    createItemAddIcon(),
                  ],
                ),
              ),
              isShowDivider ? createDivider() : Container(),
            ],
          ),
        ),
      ),
    );
  }

  /// 创建 分割线
  Widget createDivider() {
    return Container(
      width: double.infinity,
      height: 1.0,
      margin: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
      ),
      decoration: BoxDecoration(
        color: Color(0xfff2f2f2),
      ),
      alignment: Alignment.center,
    );
  }

  /// 创建 Item  image 组件
  Widget createItemImage(ProductInfo product) {
    return Container(
      width: 75.0,
      height: 70,
      child: Stack(
        children: <Widget>[
          Image(
            image: AssetImage(product.img),
            width: 70.0,
            height: 70.0,
            fit: BoxFit.cover,
          ),
          createDiscountInfo(product),
        ],
      ),
    );
  }

  /// 创建 item image 中 满减 专区
  Widget createDiscountInfo(ProductInfo product) {
    return product.discountInfo.length > 0
        ? Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 3.0,
                horizontal: 5.0,
              ),
              margin: EdgeInsets.only(
                bottom: 3.0,
              ),
              decoration: BoxDecoration(
                color: Color(0xffff8102),
                borderRadius: BorderRadius.all(
                  Radius.circular(2.0),
                ),
              ),
              child: Text(
                product.discountInfo,
                style: TextStyle(
                  fontSize: 8.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        : Container();
  }

  /// 创建添加 按钮
  Widget createItemAddIcon() {
    return Container(
      height: double.infinity,
      width: 30.0,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.all(3.0),
      child: Image(
        image: AssetImage("lib/assets/images/menu/icon_add.png"),
        width: 22.0,
        height: 22.0,
        fit: BoxFit.cover,
      ),
    );
  }

  /// 中间文字说明
  Widget createItemCenterText(ProductInfo product) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 5.0),
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
    );
  }

  ///创建 Item title 控件
  Widget createItemTitle(BuildContext context, int index) {
    ProductInfo product = productInfos.elementAt(index);
    return Container(
      height: 44.0,
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
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

  /// 创建 类别 listview 控件
  ListView createCategoryList() {
    return ListView.builder(
      itemCount: products.length,
      itemExtent: 44.0,
      padding: EdgeInsets.all(0.0),
      itemBuilder: (BuildContext context, int index) =>
          createCategoryItem(context, index),
      controller: _categoryController,
    );
  }

  ///  创建 类别Item 控件
  Widget createCategoryItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => checkCategoryItem(products.elementAt(index).categoryName),
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
    );
  }

  /// 创建 类别 位移动画
  Widget createCategoryAnimat() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.topLeft,
      child: SlideTransition(
        //// TODO 将要完成 类别 背景 滑动动画
        position: _animation,
        child: Container(
          width: double.infinity,
          height: 44.0,
          decoration: BoxDecoration(
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  /// l类别Item 单击事件
  checkCategoryItem(String category) {
    this.isCheckOrScroll = true;
    double willOffset = 0.0;
    for (var i = 0; i < productInfos.length; i++) {
      ProductInfo item = productInfos.elementAt(i);
      if (item.isCategory)
        willOffset += 44.0;
      else
        willOffset += 90.0;
      if (item.category == category) break;
    }
    // if (willOffset >= this._productsController.position.)
    //   willOffset = this._productsController.offset;
    willOffset -= 44.0;
    setState(() {
      this._productsController.animateTo(
            willOffset,
            duration: Duration(milliseconds: 500),
            curve: Curves.linear,
          );
      this.isCheckOrScroll = false;
    });
    Log.d("將要跳轉的位置 $willOffset");
  }
}
