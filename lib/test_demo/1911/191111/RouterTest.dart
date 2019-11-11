import 'package:flutter/material.dart';
import 'package:flutter_demo/generated/i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class RouterTest extends StatelessWidget {
   

 final i18n = I18n.delegate;
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        I18n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: I18n.delegate.supportedLocales,
      localeResolutionCallback: I18n.delegate.resolution(fallback: Locale("zh","CN")), 
      
      title: I18n.of(context).appName,
      home: Scaffold(
        appBar: AppBar(
          title: Text(I18n.of(context).appBarTitle),
        ),
        body: RaisedButton(
          color: Colors.teal,
          onPressed: () {},
          child: Text(I18n.of(context).goToNextPage),
        ),
      ),
    );
  }
}
