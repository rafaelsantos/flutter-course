import 'package:flutter/material.dart';
import 'package:store/tile/drawerTile.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {

    Widget _buildDrawerBack() => Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.black54
                //Color.fromARGB(255, 203, 236, 241),
                //Colors.white
              ],
              begin: Alignment.center,
              end: Alignment.bottomCenter
          )
      ),
    );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text("Shop Store",
                        style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Hello",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              "Sign in or sign up",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            onTap: () {

                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, "Start", pageController, 0),
              DrawerTile(Icons.list, "Products", pageController, 1),
              DrawerTile(Icons.location_on, "Stores", pageController, 2),
              DrawerTile(Icons.playlist_add_check, "My orders", pageController, 3),
            ],
          )
        ],
      ),
    );
  }
}
