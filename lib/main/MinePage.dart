
import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Mine Page",
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
      ),
    );
  }
  
}