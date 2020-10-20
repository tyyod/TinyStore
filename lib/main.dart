import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main/CategoryPage.dart';
import 'main/HomePage.dart';
import 'main/MinePage.dart';
import 'main/ShoppingCartPage.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => BottomNavigationBarSelector())
    ],
    child: TinyStoreApp(),
  ));
}

class TinyStoreApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainHomePage(),
    );
  }
}

class MainHomePage extends StatelessWidget {
  MainHomePage({Key key}) : super(key: key);

  static const double BOTTOM_NAVIGATION_ICON_SIZE = 28;

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final _fragmentList = [
    HomePage(),
    CategoryPage(),
    ShoppingCartPage(),
    MinePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _fragmentList[context.watch<BottomNavigationBarSelector>().currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("res/images/ic_tab_home_unselect.png", width: BOTTOM_NAVIGATION_ICON_SIZE, height: BOTTOM_NAVIGATION_ICON_SIZE,),
            activeIcon: Image.asset("res/images/ic_tab_home_select.png", width: BOTTOM_NAVIGATION_ICON_SIZE, height: BOTTOM_NAVIGATION_ICON_SIZE),
            label: "首页",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("res/images/ic_tab_categoty_unselect.png", width: BOTTOM_NAVIGATION_ICON_SIZE, height: BOTTOM_NAVIGATION_ICON_SIZE,),
            activeIcon: Image.asset("res/images/ic_tab_categoty_select.png", width: BOTTOM_NAVIGATION_ICON_SIZE, height: BOTTOM_NAVIGATION_ICON_SIZE, ),
            label: "分类",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("res/images/ic_tab_shopping_cart_unselect.png", width: BOTTOM_NAVIGATION_ICON_SIZE, height: BOTTOM_NAVIGATION_ICON_SIZE,),
            activeIcon: Image.asset("res/images/ic_tab_shopping_cart_select.png", width: BOTTOM_NAVIGATION_ICON_SIZE, height: BOTTOM_NAVIGATION_ICON_SIZE,),
            label: "购物车",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("res/images/ic_tab_mine_unselect.png", width: BOTTOM_NAVIGATION_ICON_SIZE, height: BOTTOM_NAVIGATION_ICON_SIZE,),
            activeIcon: Image.asset("res/images/ic_tab_mine_select.png", width: BOTTOM_NAVIGATION_ICON_SIZE, height: BOTTOM_NAVIGATION_ICON_SIZE,),
            label: "我的",
          )
        ],
        currentIndex: context.watch<BottomNavigationBarSelector>().currentIndex,
        onTap: (tapIndex) => context.read<BottomNavigationBarSelector>().setSelectIndex(tapIndex),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xffff4891),
        unselectedItemColor: Color(0xff262626),
        selectedFontSize: 12,
        unselectedFontSize: 12,
      ),
    );
  }
}

class BottomNavigationBarSelector with ChangeNotifier, DiagnosticableTreeMixin {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void setSelectIndex(int selectIndex) {
    _currentIndex = selectIndex;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty("currentIndex", _currentIndex));
  }
}