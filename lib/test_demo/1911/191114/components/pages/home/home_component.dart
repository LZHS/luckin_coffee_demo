import 'package:flutter/material.dart';
import 'package:flutter_demo/common_utils.dart';

class HomeComponent extends StatefulWidget {
  @override
  _HomeComponentState createState() => _HomeComponentState();
}

class _HomeComponentState extends State<HomeComponent> {
  var _deepLinkOpacity = 1.0;
  final _deepLinkURL =
      "fluro://deeplink?path=/message&mesage=fluro%20rocks%21%21";
  final _daysOfWeek = const ["星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期天"];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Log.d("_HomeComponentState - > build() size = $size");
    final childRatio = (size.width / size.height) * 2.5;
    Log.d("_HomeComponentState - > build() childRatio = $childRatio");
    var menuWidgets = <Widget>[
      menuButton(context, 'assets/images/ic_transform_native_hz.png', "原生动画",
          "native"),
      menuButton(context, 'assets/images/ic_transform_fade_in_hz.png',
          "预设(Fade In)", "preset-fade"),
      menuButton(context, 'assets/images/ic_transform_global_hz.png',
          "预设(Global transition)", "fixed-trans"),
      menuButton(context, 'assets/images/ic_transform_custom_hz.png', "自定义过度",
          "custom"),
      menuButton(
          context, 'assets/images/ic_result_hz.png', "导航器的结果", "pop-result"),
      menuButton(
          context, 'assets/images/ic_function_hz.png', "函数调用", "function-call"),
    ];

    return Material(
      color: const Color(0xff00d6f7),
      child: SafeArea(
        top: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 25.0,
                bottom: 35.0,
                left: 25.0,
              ),
              child: Image(
                width: 100.0,
                image: AssetImage("assets/images/logo_fluro.png"),
              ),
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: GridView.count(
                    childAspectRatio: childRatio,
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    children: menuWidgets,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 35.0, bottom: 25.0),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(height: 60.0),
                  child: deepLinkWidget(context),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget menuButton(
      BuildContext context, String assetSrc, String title, String key) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: FlatButton(
        color: const Color(0x22ffffff),
        highlightColor: const Color(0x11ffffff),
        splashColor: const Color(0x22ffffff),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                height: 36.0,
                child: Image.asset(
                  assetSrc,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: const Color(0xaa001133)),
            ),
          ],
        ),
        onPressed: () => _tappedMenuButton(context, key),
      ),
    );
  }

  _tappedMenuButton(BuildContext context, String key) {}

  Widget deepLinkWidget(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedOpacity(
          duration: Duration(milliseconds: 1000),
          opacity: _deepLinkOpacity,
          child: Center(
            child: Text(
              "Copied to clipboard!",
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: Color(0xffffffff),
              ),
              
            ),
          ),
        ),
      ],
    );
  }
}
