import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:luckin_coffee_demo/common/config/application.dart';

/// 选择手机区号页面
class PhoneAreaPage extends StatelessWidget {
  final datas = [
    {"name": "中国", "code": "+86"},
    {"name": "香港（中国）", "code": "+852"},
    {"name": "美国", "code": "+1"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.appBackgroundColor,
        appBar: AppBarCustom(
          title: "选择手机区号",
          onClickLeft: () {
            Application.router.pop(context, "${datas[0]["name"]}（${datas[0]["code"]}）");
          },
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: ListView.builder(
              itemCount: datas.length, itemBuilder: _buildItemWidget),
        ));
  }

  Widget _buildItemWidget(BuildContext context, int index) => FlatButton(
    padding: const EdgeInsets.all(0),
        onPressed: () {
          var res = "${datas[index]["name"]}（${datas[index]["code"]}）";
          Application.router.pop(context, res);
        },
        child: Container(
          width: double.infinity,
          height: 50,
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    datas[index]["name"],
                    style:
                        TextStyle(fontSize: 15, color: AppColors.appTitleColor),
                  ),
                  Text(
                    datas[index]["code"],
                    style: TextStyle(
                        fontSize: 15, color: AppColors.appHintTextColor),
                  ),
                ],
              )),
              Visibility(
                  visible: index != (datas.length - 1), child: DividerWidget())
            ],
          ),
        ),
      );
}
