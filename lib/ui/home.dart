import 'package:course_project/ui/favorite/favorite_screen.dart';
import 'package:flutter/material.dart';

import '../flavor/config.dart';
import 'dessert_screen.dart';
import 'seafood_screen.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  _setPage() {
    if (_index == 0) {
      return DessertScreen();
    } else if (_index == 1) {
      return SeafoodScreen();
    } else {
      return FavoriteScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Config.appString),
        actions: <Widget>[
          IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchScreen()));
          },
        )
        ],
      ),
      body: _setPage(),
      bottomNavigationBar: BottomNavigationBar(
        key: const Key('bottom'),
        currentIndex: _index,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.cake),
            label: 'Dessert',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label:  'Seafood',
          ),BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorite',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              setState(() {
                _index = 0;
              });
              break;
            case 1:
              setState(() {
                _index = 1;
              });
              break;
            case 2:
              setState(() {
                _index = 2;
              });
              break;
          }
        },
      ),
    );
  }
}
