part of 'theme_cubit.dart';
 class ThemeState {

  final ThemeData theme;
  final MaterialColor color;

  ThemeState({@required this.theme,@required this.color})
      : assert(theme != null),
       assert(color != null);
 }

