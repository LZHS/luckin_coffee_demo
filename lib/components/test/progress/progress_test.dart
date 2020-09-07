import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:luckin_coffee_demo/common/widgets/down_progress.dart';

class ProgressTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("下载进度条"),
      ),
      body: Center(

        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.all(10.0),child: const Text("进度条"),),
              SizedBox(height: 30.0,width: double.infinity,child: DownProgress(),)
            ],
          ),

        ),

      ),
    );
  }
}
