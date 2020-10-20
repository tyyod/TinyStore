
import 'package:flutter/material.dart';

class ShoppingCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("购物车"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("ShoppingCartPage",
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
      ),
    );
  }

}