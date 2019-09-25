import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      title: 'Layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        
        body: ListView(
          children: [
            Image.asset(
              'images/lake.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            //titleSection,
            // buttonSection,
            // textSection,
          ],
        ),
      ),
    );
  }
}
