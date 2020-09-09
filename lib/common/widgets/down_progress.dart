import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:luckin_coffee_demo/models/bloc/bloc.dart';

class DownProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DownCubit>(
      create: (context) => DownCubit(BlocProvider.of<TransitionsCubit>(context)),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: double.infinity,
          minHeight: 30.0,
          maxWidth: double.infinity,
          maxHeight: double.infinity,
        ),
        child: BlocBuilder<DownCubit, DownState>(
          builder: (_, state) => Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  constraints: BoxConstraints.tightFor(
                    width: double.infinity,
                    height: 30.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.appTheme4280BD,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.transparent,
                    valueColor:
                        AlwaysStoppedAnimation(AppColors.appTheme4280BD),
                    value: state.getScale,
                  ),
                ),
              ),
              Text(
                  "${state.getReceived}/${state.getTotal}(MB)   ${state.getScaleValue}%"),
            ],
          ),
        ),
      ),
    );
  }
}
