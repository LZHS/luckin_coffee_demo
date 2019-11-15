 
import 'package:flutter/material.dart';
import 'package:flutter_demo/common_utils.dart';
import 'package:flutter_demo/fluro/src/router.dart';
import 'package:flutter_demo/test_demo/1911/191114/config/application.dart';
import 'package:flutter_demo/test_demo/1911/191114/config/routers.dart';
 
class AppComponent extends StatefulWidget {
  @override
  _AppComponentState createState() => _AppComponentState();
}

class _AppComponentState extends State<AppComponent> {
  _AppComponentState() {
    final router = Router();
    Routers.configureRouters(router);
    Application.router = router;
  }
  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      title: "Fluro Demo",
      theme: ThemeData(primaryColor: Colors.blue),
      onGenerateRoute: Application.router.generator,
    );

    Log.d("initial route = ${app.initialRoute}");
    return app;
  }
}
