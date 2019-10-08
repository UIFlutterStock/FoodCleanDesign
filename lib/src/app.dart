import 'package:flutter/material.dart';
import 'package:foodcleandesign/src/pages/pages.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Food Clean Design - Tab With Rxdart and Bloc.",
        debugShowCheckedModeBanner: false,
        home: TabHomePage(),
        theme: ThemeData(
            fontFamily: "Quicksand",
            scaffoldBackgroundColor: Colors.white,
            textTheme: TextTheme(body1: TextStyle(fontSize: 16))));
  }
}
