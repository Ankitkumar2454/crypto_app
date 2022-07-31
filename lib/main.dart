import 'package:crypto_app/detailPage.dart';
import 'package:crypto_app/favoritePage.dart';
import 'package:crypto_app/homePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        // DetailPage.id: (context) => DetailPage(),
        FavoritePage.id: (context) => FavoritePage(),
      },
    );
  }
}