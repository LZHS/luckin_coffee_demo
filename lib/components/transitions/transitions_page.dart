import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:luckin_coffee_demo/data_provider/manager/beans/app_notice_info.dart';
import 'package:luckin_coffee_demo/models/bloc/bloc.dart';

/// 应用的第一个页面 过渡页面
///
class TransitionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransitionsCubit>(
      create: (context) => TransitionsCubit(context),
      child: Container(
        foregroundDecoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/images/icon_transition.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: BlocBuilder<TransitionsCubit, TransitionsState>(
          builder: (context, state) {
            if (state.type == TransitionsType.INIT)
              _showNoticeDialog(state.noticeInfo);
            if (state.type == TransitionsType.NO_ACTION)
              return BlocProvider<TimerCubit>(
                create: (_) => TimerCubit(),
                child: Container(),
              );

            return Container();
          },
        ),
      ),
    );
  }

  /// 显示 公告对话框
  void _showNoticeDialog(AppNoticeInfo noticeInfo) {}
}
