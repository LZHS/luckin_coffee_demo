import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:luckin_coffee_demo/common/global.dart';
import 'package:luckin_coffee_demo/models/bloc/bloc.dart';

/// 应用的第一个页面 过渡页面
///
class TransitionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransitionsCubit>(
      create: (context) => TransitionsCubit(context),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/images/icon_transition.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: BlocBuilder<TransitionsCubit, TransitionsState>(
          builder: (context, state) {
            if (state.type == TransitionsType.SHOW_NOTICE)
              _showNoticeDialog(context, state.noticeInfo);
            if (state.type == TransitionsType.NO_ACTION)
              return _buildTimerWidget();
            return Container();
          },
        ),
      ),
    );
  }

  /// 创建 倒计时控件
  _buildTimerWidget() => BlocProvider<TimerCubit>(
    create: (context) => TimerCubit(context),
        child: BlocBuilder<TimerCubit, int>(
          builder: (context, duration) {
            return Visibility(
              visible: duration != 0,
              child: Container(
                alignment: FractionalOffset.topRight,
                margin: EdgeInsets.fromLTRB(0.0, 30.0, 10.0, 0.0),
                child: FlatButton(
                  onPressed: () => context.bloc<TimerCubit>().timerComplete(),
                  color: Colors.grey[350],
                  child: Text(
                    "$duration | 跳过",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );

  _showNoticeDialog(BuildContext context, noticeInfo) {
    Future.delayed(
      Duration.zero,
          () =>
          showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext dialogContext) {
              return NoticeDialog(
                noticeInfo: noticeInfo,
                onTap: () {
                  log.d("对话框退出了");
                  context.bloc<TransitionsCubit>().closeNoticeDialog();
                },
              );
            },
          ),
    );
  }
}
