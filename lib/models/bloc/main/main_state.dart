part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainCurrentState extends MainState {
  final int currentIndex ;

  MainCurrentState( this.currentIndex );

}
