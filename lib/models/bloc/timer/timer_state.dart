part of 'timer_cubit.dart';

class TimerState {
  int duration = 0;

  TimerType type;

  TimerState();
}

enum TimerType {
  RunInProgress,
  RunComplete,
}
