
import 'dart:io';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePageViewModel _viewModel;
  HomePage({Key key}) : super(key: key) {
    _viewModel = HomePageViewModel();
    _viewModel.loadHomePageData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              "HomePage",
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
      ),
    );
  }
}

class HomePageViewModel {

  void loadHomePageData() async {
    HttpClient httpClient = HttpClient();
    var uri = Uri.http("127.0.0.1:8081", "/tiny/store/home");
    var request = await httpClient.getUrl(uri);
    var response = request.close();
  }
}