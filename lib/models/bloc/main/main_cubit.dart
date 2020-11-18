import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit([BuildContext context]) : super(MainCurrentState(0));

  changeCurrentPage(int index){
    emit(MainCurrentState(index));
  }


}
