import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:luckin_coffee_demo/models/bloc/bloc.dart';

class AppComponent extends StatefulWidget {
  @override
  _AppComponentState createState() => _AppComponentState();
}

class _AppComponentState extends State<AppComponent> {
  _AppComponentState() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
    Application.init();
  }

  @override
  Widget build(BuildContext context) {
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
