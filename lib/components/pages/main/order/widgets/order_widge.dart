import 'package:flutter/material.dart';
import 'package:flutter_demo/common/common_utils.dart';
import 'package:flutter_demo/common/widgets/divider_widget.dart';
import 'package:flutter_demo/components/pages/main/order/beans/order_bean.dart';
import 'package:flutter_demo/components/pages/main/order/enums/order_state_enum.dart';

///```
/// 订单模块 item 布局
/// OrderBean 为每个订单元素数据
///```
class OrderWidge extends StatefulWidget {
  final OrderBean _order;
  final onClickEnent _clickEnent;
  OrderWidge(this._order, this._clickEnent);

  @override
  _OrderWidgeState createState() => _OrderWidgeState();
}

class _OrderWidgeState extends State<OrderWidge> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color(0xffF8F8F8),
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            // 订单号 订单状态
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 12.0, bottom: 9.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(right: 30.0),
                    child: Text(
                      "外卖订单：${widget._order.orderId}",
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Color(0xffa6a6a6),
                      ),
                    ),
                  ),
                  Text(
                    widget._order.orderStatus,
                    style: TextStyle(
                      fontSize: 13.0,
                      color: widget._order.orderStatus == '待付款'
                          ? Color(0xff88afd5)
                          : Color(0xffa6a6a6),
                    ),
                  ),
                ],
              ),
            ),
            DividerWidget(),
            //  收货地址 时间
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 11.0, bottom: 3.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Text(
                        widget._order.customerAddress,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color(0xff383838),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    widget._order.orderTime,
                    style: TextStyle(fontSize: 12.0, color: Color(0xffa6a6a6)),
                  ),
                ],
              ),
            ),
            //货品信息
            Container(
              width: double.infinity,
              child: Text(
                createProduct(),
                style: TextStyle(
                  fontSize: 13.0,
                  color: Color(0xff505050),
                ),
              ),
            ),
            // 总价 以及 动作
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 22.0, bottom: 15.0),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "￥ ${widget._order.totalPrice}",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xff383838),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          createPlayBtn(),
                          createAgainBtn(),
                          createEvaluationBtn(),
                        ],
                      ),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  String createProduct() {
    String resultStr = '';
    widget._order.products.forEach(
      (pro) => resultStr += "$pro,",
    );
    resultStr..substring(0, resultStr.length);
    return resultStr += "   共${widget._order.products.length}商品";
  }

  /// 創建 再来一单 Buttom
  createAgainBtn() {
    return Offstage(
      offstage: widget._order.orderStatus == "待付款",
      child: Padding(
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        child: Material(
          child: Ink(
            width: 74.0,
            height: 28.0,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
              border: Border.all(
                width: 1.0,
                color: Color(0xfff2f2f2),
              ),
            ),
            child: InkResponse(
              borderRadius: new BorderRadius.all(new Radius.circular(4.0)),
              highlightColor: Color(0x99f2f2f2),
              highlightShape: BoxShape.rectangle,
              radius: 74.0,
              splashColor: Color(0x99f2f2f2),
              containedInkWell: true,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "再来一单",
                  style: TextStyle(
                    color: Color(0xffa6a6a6),
                    fontSize: 13.0,
                  ),
                ),
              ),
              onTap: () {
                widget._clickEnent(widget._order.orderId, OrderStateEnum.align);
                Log.d(" 你 点击了 再来一单 按钮 当前 订单id ${widget._order.orderId}");
              },
            ),
          ),
        ),
      ),
    );
  }

  /// 創建 去评价 Buttom
  createEvaluationBtn() {
    return Offstage(
      offstage: !widget._order.isEvaluation,
      child: Padding(
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        child: Material(
          child: Ink(
            width: 74.0,
            height: 28.0,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
              border: Border.all(
                width: 1.0,
                color: Color(0xff90c0ef),
              ),
            ),
            child: InkResponse(
              borderRadius: new BorderRadius.all(new Radius.circular(4.0)),
              highlightColor: Color(0xff90c0ef),
              highlightShape: BoxShape.rectangle,
              radius: 74.0,
              splashColor: Color(0xff90c0ef),
              containedInkWell: true,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "去评价",
                  style: TextStyle(
                    color: Color(0xff90c0ef),
                    fontSize: 13.0,
                  ),
                ),
              ),
              onTap: () {
                widget._clickEnent(
                    widget._order.orderId, OrderStateEnum.evaluation);
                Log.d(" 你 点击了 去评价 按钮 当前 订单id ${widget._order.orderId}");
              },
            ),
          ),
        ),
      ),
    );
  }

  /// 創建 去支付Buttom
  createPlayBtn() {
    return Offstage(
      offstage: widget._order.orderStatus != "待付款",
      child: Material(
        child: Ink(
          width: 74.0,
          height: 28.0,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            ),
            border: Border.all(
              width: 1.0,
              color: Color(0xffff8102),
            ),
          ),
          child: InkResponse(
            borderRadius: new BorderRadius.all(new Radius.circular(4.0)),
            //点击或者toch控件高亮时显示的控件在控件上层,水波纹下层
            highlightColor: Color(0x99ff8102),
            //点击或者toch控件高亮的shape形状
            highlightShape: BoxShape.rectangle,
            //水波纹的半径
            radius: 74.0,
            //水波纹的颜色
            splashColor: Color(0x99ff8102),
            //true表示要剪裁水波纹响应的界面   false不剪裁  如果控件是圆角不剪裁的话水波纹是矩形
            containedInkWell: true,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "去支付",
                style: TextStyle(
                  color: Color(0xffff8102),
                  fontSize: 13.0,
                ),
              ),
            ),
            onTap: () {
              widget._clickEnent(widget._order.orderId, OrderStateEnum.play);
              Log.d(" 你 点击了 支付按钮 当前 订单id ${widget._order.orderId}");
            },
          ),
        ),
      ),
    );
  }
}

typedef onClickEnent = void Function(String orderId, OrderStateEnum stateEnum);
