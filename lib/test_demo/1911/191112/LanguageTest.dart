import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo/common_utils.dart';
import 'package:flutter_demo/generated/i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        I18n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate // <-- needed for iOS
      ],
      supportedLocales: I18n.delegate.supportedLocales,
      localeResolutionCallback:
          I18n.delegate.resolution(fallback: new Locale("en", "US")),
      home: LanguageTest(),
    );
  }
}

class LanguageTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(I18n().appName),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Text("语言包"),
          Text(I18n.of(context).greetTo("德玛西亚")),
          RaisedButton(
            child: Text(I18n().btnText),
            onPressed: () {
              var isTrue=Random().nextInt(10) % 2 == 0;
              Log.d("是否是奇数 ： $isTrue");
              if (isTrue)
                I18n.locale = Locale("en", "US");
              else
                I18n.locale = Locale("zh", "CN");
            },
          )
        ],
      )),
    );
  }
}
