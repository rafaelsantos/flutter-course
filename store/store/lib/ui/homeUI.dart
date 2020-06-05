import 'package:flutter/material.dart';

class HomeUI extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[

      ],
    );
  }
}
