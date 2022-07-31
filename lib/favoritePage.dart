import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  String imageUrl;
  String name;
  FavoritePage({
    Key? key,
    required this.imageUrl,
    required this.name,
  }) : super(key: key);

  static String id = 'favoritepage';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            "favorite page",
            style: TextStyle(
              fontSize: 40,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: ((context, index) {
            return Card(
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10),
                    child: Container(
                      height: 40,
                      width: 50,
                      child: Image.network(
                        imageUrl,
                      ),
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
