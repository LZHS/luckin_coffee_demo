part of 'down_cubit.dart';

class DownState {
  int received = 0, total = 0;

  DownState();

  DownState.build({this.received, this.total});

  get getReceived => (received * 1.0 / (1024 * 1024)).toStringAsFixed(2);

  get getTotal => (total * 1.0 / (1024 * 1024)).toStringAsFixed(2);

  get getScale {
    if (total <= 0) return 0.0;
    return double.parse((received * 1.0 / total).toStringAsFixed(4));
  }

  get getScaleValue => getScale * 100.0;
}
