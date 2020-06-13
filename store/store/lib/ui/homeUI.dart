import 'package:flutter/material.dart';
import 'package:store/tab/categoryTab.dart';
import 'package:store/tab/homeTab.dart';
import 'package:store/widget/customDrawerWidget.dart';

class HomeUI extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Categories"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: CategoryTab(),
        )
      ],
    );
  }
}
