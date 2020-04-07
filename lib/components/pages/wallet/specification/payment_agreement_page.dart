import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/widgets/head_title_bar.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/widgets/payment_hint_widget.dart';
import 'package:luckin_coffee_demo/config/res/colors.dart';

/// 支付协议页面
class PaymentAgreementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HeadTitleBar(
          title: "支付协议",
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              WalletInfoHintWidget(),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12.0, bottom: 150.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 32.0, bottom: 32.0),
                      child: Text(
                        "支付授权书",
                        style:
                            TextStyle(color: appBarTitleColor, fontSize: 28.0),
                      ),
                    ),
                    buildText("一、授权人兹授权北京瑞吉咖啡有限公司(以下简称“乙方”)通过第三方支付平台划扣服务费。"),
                    buildText("二、服务费是指授权人通过luckin coffee提交的订单上记载的总费用。"),
                    buildText(
                        "三、在授权人成功提交订单后，乙方依照luckin coffee上公布的收费规则计算服务费用。授权人应在5分钟内根据页面指示完成支付。"),
                    buildText(
                        "四、如因授权人在第三方支付平台中的支付账户被锁定、无效、盗用、被往来银行拒绝等，以致支付账户请款失败时，乙方有权依据与授权人之消费账单要求授权人支付服务费。"),
                    buildText("五、授权人如有冒用他人支付账户之行为，须自负法律责任。"),
                    buildText(
                        "六、在使用luckin coffee服务的过程中，如授权人未遵从相关规则，则乙方有权拒绝为授权人提供相关服务，且无需承担任何责任。因授权人的过错导致的任何损失由授权人承担，该等过错包括但不限于:不按照交易提示操作，未及时进行交易操作等。"),
                    buildText(
                        "七、授权人同意其消费产生的服务费用以乙方记录的数据为准，并通过luckin coffee告知授权人。授权人对服务费用有异议或扣款金额与应缴费用金额不符时，可及时与客服4000100100联系。"),
                  ],
                ),
              )
            ],
          ),
        )));
  }

  buildText(String content) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 24.0),
      child: Text(
        content,
        style: TextStyle(color: Color(0xff505050), fontSize: 16.0, height: 1.5),
      ),
    );
  }
}

/*










 */
