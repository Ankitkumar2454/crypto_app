
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  static String id = 'favoritepage';
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: ((context, index) {
        return Card(color: Colors.blue,
        child: Image.asset('imageurl'));
      }),
    );
  }
}
