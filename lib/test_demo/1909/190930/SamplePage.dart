import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/common_utils.dart';

class SamplePage extends StatelessWidget {
  const SamplePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5.0,
        centerTitle: true,
        title: Text(
          "发布成功",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.normal),
        ),
        leading: IconButton(
          icon: Image.asset("images/nav_close.png"),
          onPressed: () {
            Navigator.maybePop(context);
          },
        ),
      ),
      body: SamplePageContent(),
    );
  }
}

class SamplePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 42.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 52.0,
                height: 52.0,
                margin: const EdgeInsets.only(left: 16.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage("images/avatar2.png"),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 7.0,
                  right: 15.0,
                ),
                height: 45.0,
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      "images/publish_chat_box.png",
                    ),
                    Positioned(
                      left: 25.0,
                      top: 14.0,
                      child: Text(
                        "张老师发布了一个任务，请接收~",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(6.0, 24.0, 6.0, 30.0),
            child: RoundInnerSquareBox(
              child: Container(
                padding: const EdgeInsets.fromLTRB(24.0, 28.0, 24.0, 12.0),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Unit 1 Lesson 3 About animal",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: "Round",
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 5.0,
                        bottom: 13.0,
                      ),
                      child: Image.asset("images/publish_work_line.png"),
                    ),
                    Wrap(
                      alignment: WrapAlignment.start,
                      children: <Widget>[
                        WorkTotalItem(
                          title: "课文跟读 01",
                        ),
                        WorkTotalItem(
                          title: "课文跟读 02",
                        ),
                        WorkTotalItem(
                          title: "课文跟读 03",
                        ),
                        WorkTotalItem(
                          title: "课文跟读 04",
                        ),
                        WorkTotalItem(
                          title: "课文跟读 05",
                        ),
                        WorkTotalItem(
                          title: "课文跟读 06",
                        ),
                        WorkTotalItem(
                          title: "课文跟读 07",
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 180.0),
                      child: Stack(
                        children: <Widget>[
                          Image.asset("images/publish_work_sign.png"),
                          Positioned(
                            left: 4.0,
                            top: 4.0,
                            child: Text(
                              "预习",
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(top: 15.0),
                      child: Text(
                        "明天 12:00 截止",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          LineTips(
            title: Text(
              "给家长发个通知吧",
              style: TextStyle(
                fontSize: 14.0,
                color: const Color(0xff757085),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 32.0,
            ),
            height: 60.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 60.0,
                  icon: Image.asset("images/share_wechat.png"),
                  onPressed: () {
                    Log.d("share to wechat");
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(left: 32.0),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 60.0,
                    icon: Image.asset("images/share_qq.png"),
                    onPressed: () {
                      Log.d("share to QQ");
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RoundInnerSquareBox extends StatelessWidget {
  static const double gap = 12.0;
  final Widget child;
  RoundInnerSquareBox({@required this.child});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(const Radius.circular(16.0)),
      child: Container(
        color: const Color(0xfff0d5a9),
        padding: const EdgeInsets.all(gap),
        child: Container(
          child: Container(
            color: Color(0xff3c594e),
            child: child,
          ),
        ),
      ),
    );
  }
}

class WorkTotalItem extends StatelessWidget {
  final String title;
  WorkTotalItem({
    this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      child: Text(
        "$title",
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.white,
        ),
      ),
    );
  }
}

class LineTips extends StatelessWidget {
  static const defaultMargin = const EdgeInsets.only(
    left: 15.0,
    right: 15.0,
  );

  final Widget title;
  final EdgeInsetsGeometry margin;
  LineTips({
    @required this.title,
    this.margin = defaultMargin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                right: 10.0,
              ),
              color: const Color(0xffd4cfe4),
              height: 1.0,
            ),
          ),
          title,
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                left: 10.0,
              ),
              color: const Color(0xffd4cfe4),
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
