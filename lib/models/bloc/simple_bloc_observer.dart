import 'package:logger/logger.dart';

import 'bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  Logger _logger =
      Logger(printer: PrettyPrinter(colors: false, printTime: true));

  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    _logger.v('onEvent $event');
  }

  @override
  onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    _logger.v('onTransition $transition');
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    super.onError(cubit, error, stackTrace);
    _logger.e('onError $error');
  }
}
