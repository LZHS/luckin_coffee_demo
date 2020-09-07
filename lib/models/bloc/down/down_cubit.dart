import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'down_state.dart';

class DownCubit extends Cubit<DownState> {
  DownCubit() : super(DownInitial());
}
