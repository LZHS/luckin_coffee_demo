import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/global.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(ThemeState(
          theme: ThemeData(primaryColor: Colors.white),
          color: Colors.lightBlue,
        ));

  changedTheme(ThemeEnum themeEnum) {

    ThemeState theme;
    switch (themeEnum) {
      case ThemeEnum.defaultTheme:
        theme = ThemeState(
          theme: ThemeData(
            primaryColor: Colors.deepPurpleAccent,
          ),
          color: Colors.deepPurple,
        );

        break;
      default:
        theme = ThemeState(
          theme: ThemeData.light(),
          color: Colors.lightBlue,
        );
        break;
    }
    emit(theme);
  }
}

enum ThemeEnum { defaultTheme }
