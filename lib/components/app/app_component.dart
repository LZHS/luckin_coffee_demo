
import 'package:flutter/material.dart';
import 'package:flutter_demo/common/fluro/router.dart';
import 'package:flutter_demo/config/Routes.dart';
import 'package:flutter_demo/config/application.dart';

class AppComponent extends StatefulWidget {
  @override
  _AppComponentState createState() => _AppComponentState();
}

class _AppComponentState extends State<AppComponent> {

  _AppComponentState(){
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }
  @override
  Widget build(BuildContext context) {
     final app = MaterialApp(
      title: 'Fluro', 
      theme: ThemeData(
        primarySwatch: Colors.lime,
        primaryColor:Colors.white
      ),
      onGenerateRoute: Application.router.generator,
    );
    return app;
  }
}