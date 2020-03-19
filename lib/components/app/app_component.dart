import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common_utils.dart';
import 'package:luckin_coffee_demo/common/fluro/router.dart';
import 'package:luckin_coffee_demo/config/Routes.dart';
import 'package:luckin_coffee_demo/config/application.dart';

class AppComponent extends StatefulWidget {
  @override
  _AppComponentState createState() => _AppComponentState();
}

class _AppComponentState extends State<AppComponent> {
  _AppComponentState() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }
  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Fluro',
      theme: ThemeData( primaryColor:Colors.white),
      onGenerateRoute: Application.router.generator,
    );
    return app;
  }
}
