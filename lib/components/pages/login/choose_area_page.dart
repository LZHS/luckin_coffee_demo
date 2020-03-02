import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/widgets/divider_widget.dart';
import 'package:luckin_coffee_demo/common/widgets/head_title_bar.dart';
import 'package:luckin_coffee_demo/config/application.dart';

/// 选择国家/地区
class ChooseAreaPage extends StatefulWidget {
  @override
  _ChooseAreaPageState createState() => _ChooseAreaPageState();
}

class _ChooseAreaPageState extends State<ChooseAreaPage> {
  List area = [" 中国 ", " 香港(中国) ", " 美国 "];
  List areaNum = ["+86", "+852", "+1"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeadTitleBar(title: "选择国家/地区"),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: ListView.builder(
            itemCount: area.length,
            itemBuilder: (context, index) {
              return Material(
                color: Colors.white,
                child: Ink(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: InkResponse(
                    splashColor: Color(0xaaf2f2f2),
                    highlightShape: BoxShape.rectangle,
                    containedInkWell: true,
                    onTap: () {
                      Application.router.pop(context,
                          [area.elementAt(index), areaNum.elementAt(index)]);
                    },
                    child: Container(
                      height: 50.0,
                      width: double.infinity,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    area.elementAt(index),
                                    style: TextStyle(
                                        color: Color(0xff383838),
                                        fontSize: 15.0),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 15.0),
                                  child: Text(
                                    areaNum.elementAt(index),
                                    style: TextStyle(
                                        color: Color(0xffa6a6a6),
                                        fontSize: 15.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          DividerWidget(
                            left: 15.0,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
