import 'package:flutter/material.dart';
import 'package:flutter_demo/common/common_utils.dart';
import 'package:flutter_demo/common/widgets/head_title_bar.dart';

///```
/// 订单评价页面
/// orderId 将要评价的 订单ID
///```
class EvaluationPage extends StatefulWidget {
  final String orderId;

  const EvaluationPage({Key key, @required this.orderId}) : super(key: key);

  @override
  _EvaluationPageState createState() => _EvaluationPageState();
}

class _EvaluationPageState extends State<EvaluationPage> {
  bool isSatisfied = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeadTitleBar(
        title: "评价",
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 25.0, bottom: 18.0),
                    child: Text(
                      "“${isSatisfied ? '满意' : '失望'}”",
                      style: TextStyle(
                        color: Color(0xff383838),
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        child: Image(
                          image: AssetImage(isSatisfied
                              ? 'lib/assets/images/order/icon_satisfied.png'
                              : 'lib/assets/images/order/icon_satisfied_un.png'),
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.contain,
                        ),
                        onTap: () {
                          setState(() {
                            if (!this.isSatisfied) this.isSatisfied = true;
                          });
                        },
                      ),
                      Container(
                        width: 30.0,
                      ),
                      InkWell(
                        child: Image(
                          image: AssetImage(isSatisfied
                              ? 'lib/assets/images/order/icon_satisfied_no_un.png'
                              : 'lib/assets/images/order/icon_satisfied_no.png'),
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.contain,
                        ),
                        onTap: () {
                          setState(() {
                            if (this.isSatisfied) this.isSatisfied = false;
                          });
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 29.0, 16.0, 19.0),
                    child: Container(
                      height: 125.0,
                      width: double.infinity,
                      color: Color(0xfff8f8f8),
                    ),
                  )
                ],
              ),
            ),

            Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  color: Color(0xfff8f8f8),
                )),

            /// 提交按钮
            Container(
              width: double.infinity,
              height: 60.0,
              child: Center(
                child: Material(
                  child: Ink(
                    decoration: BoxDecoration(
                      color: Color(0xff90c0ef),
                      borderRadius: BorderRadius.all(
                        Radius.circular(2.0),
                      ),
                    ),
                    child: InkResponse(
                      borderRadius: BorderRadius.all(
                        Radius.circular(2.0),
                      ),
                      highlightColor: Color(0x955000000),
                      highlightShape: BoxShape.rectangle,
                      radius: 0.0,
                      onTap: () {
                        Log.d(" 你点击了提交按钮");
                      },
                      child: Container(
                        width: 345.0,
                        height: 40.0,
                        alignment: Alignment.center,
                        child: Text(
                          "提交",
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
