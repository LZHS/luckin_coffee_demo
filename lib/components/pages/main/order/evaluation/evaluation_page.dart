import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/common/common_utils.dart';
import 'package:flutter_demo/common/widgets/head_title_bar.dart';
import 'package:flutter_demo/config/application.dart';
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
  int inputNum = 0;

  String inputOdlOk = "", inputOdlNo = '';
  final TextEditingController _controller = TextEditingController();
  void setText(text) {
    _controller.value = _controller.value.copyWith(
      text: text,
      selection:
          TextSelection(baseOffset: text.length, extentOffset: text.length),
      composing: TextRange.empty,
    );
    inputNum = text.length;
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.text.length > 200) {
        Log.d("亲，您已输入了200个字符");
        showToast("亲，您已输入了200个字符");
        setText(_controller.text.substring(0, 200));
      }
      if (isSatisfied)
        inputOdlOk = _controller.text;
      else
        inputOdlNo = _controller.text;
      setState(() {
        inputNum = _controller.text.length;
      });
    });
  }

  @override
  void dispose() {
    this._controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: HeadTitleBar(
        title: "评价",
        leftCheck: (){
          Application.router.pop(this.context);
    FocusScope.of(context).requestFocus(FocusNode());

        },
      ),
      body: Container(
        color: Colors.white,
        child: Column(
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
                            if (!this.isSatisfied) {
                              this.isSatisfied = true;
                              setText(inputOdlOk);
                            }
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
                            if (this.isSatisfied) {
                              this.isSatisfied = false;
                              setText(inputOdlNo);
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  Container(
                    height: 125.0,
                    margin: EdgeInsets.fromLTRB(16.0, 29.0, 16.0, 19.0),
                    width: double.infinity,
                    color: Color(0xfff8f8f8),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 10.0, top: 10.0, right: 10.0),
                            child: TextField(
                              controller: _controller,
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.go,
                              maxLines: 8,
                              autocorrect: true,
                              style: TextStyle(
                                fontSize: 13.0,
                              ),
                              decoration: InputDecoration(
                                hintText: "请输入评价内容（可不填）",
                                contentPadding: EdgeInsets.all(2),
                                hintStyle: TextStyle(
                                  fontSize: 13.0,
                                  color: Color(0xffa6a6a6),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 20.0,
                          width: double.infinity,
                          margin: EdgeInsets.only(right: 10.0),
                          alignment: Alignment.centerRight,
                          child: Text(
                            "$inputNum/200",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Color(0xff505050),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
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
                        showToast("${_controller.text}");
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
