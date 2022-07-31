import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  List coinlist;
  FavoritePage({
    required this.coinlist,
  });

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
        body: Container(
          color: Colors.black,
          child: ListView.builder(
            itemCount: coinlist.length,
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
                          coinlist[index].name,
                        ),
                      ),
                    ),
                    Text(
                      coinlist[index]['name'],
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
      ),
    );
  }
}
