import 'package:flutter/material.dart';
import 'package:crypto_app/coin.dart';

class FavoritePage extends StatelessWidget {
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
          child: ListView.builder(
            itemCount: coinList.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Card(
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
                            coinList[index].imageUrl,
                          ),
                        ),
                      ),
                      Text(
                        coinList[index].name,
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
