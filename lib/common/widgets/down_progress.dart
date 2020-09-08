import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:luckin_coffee_demo/models/bloc/bloc.dart';

class DownProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DownCubit>(
      create: (_) => DownCubit(),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: double.infinity,
          minHeight: 35.0,
          maxWidth: double.infinity,
          maxHeight: double.infinity,
        ),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  constraints: BoxConstraints.tightFor(
                    width: double.infinity,
                    height: double.infinity,
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
                    value: .3,
                  ),
                )),
            Center(
                child: BlocBuilder<DownCubit, DownState>(
              builder: (_, state) => const Text("33.08/33.08(MB)   100%"),
            ))
          ],
        ),
      ),
    );
  }
}
