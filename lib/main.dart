import 'package:flutter/material.dart';

import 'ui/home.dart';

void main() => runApp(const MyApplication());

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TheMealDB',
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}