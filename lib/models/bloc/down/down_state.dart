part of 'down_cubit.dart';

class DownState {
  double received = 0.0, total = 0.0;

  DownState();

  DownState.build({this.received, this.total});

  get getReceived => (received / (1024 * 1024)).toStringAsFixed(2);

  get getTotal => (total / (1024 * 1024)).toStringAsFixed(2);

  get getScale {
    if (total <= 0.0) return 0.0;
    return double.parse((received / total).toStringAsFixed(4));
  }

  get getScaleValue => getScale * 100.0;
}
