import 'package:flutter/material.dart';
import 'package:flutter_demo/generated/i18n.dart';

class PageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(I18n.of( context ).appBarTitle),
      ),
      
    );
  }
}