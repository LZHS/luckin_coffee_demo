import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:luckin_coffee_demo/models/bloc/bloc.dart';
import 'package:fluro/fluro.dart' as fluro_router;


class AppComponent extends StatefulWidget {
  @override
  _AppComponentState createState() => _AppComponentState();
}

class _AppComponentState extends State<AppComponent> {
  _AppComponentState() {
    final router = fluro_router.Router();
    Routes.configureRoutes(router);
    Application.router = router;
    Application.init();
  }

  @override
  Widget build(BuildContext context) {
    Application.context=context;
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (_, state) {
          return MaterialApp(
            title: 'Luckin',
            theme: state.theme,
            onGenerateRoute: Application.router.generator,
          );
        },
      ),
    );
  }
}
