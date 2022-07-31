import 'dart:convert';

import 'package:crypto_app/favoritePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:crypto_app/detailPage.dart';

class HomePage extends StatefulWidget {
  static String id = 'homepage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Map<String, String> headers = {
  //   "Content-Type": "application/json",
  //   "Accept": "application/json",
  //   "X-CMC_PRO_API_KEY": "88cba1f2-73e8-451c-9889-58a3e77d0f75",
  // };
  // Future<List<Coin>> fetchCoin() async {
  //   coinList = [];
  //   Response response = await get(
  //       Uri.parse(
  //           'https://pro-api.coinmarketcap.com/v1/cryptocurrency/category'),
  //       headers: headers);

  //   if (response.statusCode == 200) {
  //     List<dynamic> values = [];
  //     values = jsonDecode(response.body);
  //     print(values); //json

  //     // if (values.length > 0) {
  //     //   for (int i = 0; i < values.length; i++) {
  //     //     if (values[i] != null) {
  //     //       Map<String, dynamic> map = values[i];
  //     //       coinList.add(Coin.fromJson(map));
  //     //     }
  //     //   }
  //     //   setState(() {
  //     //     coinList;
  //     //   });
  //     // }
  //   } else {
  //     throw Exception('Failed to load coins');
  //   }
  //   return coinList;
  // }

  // @override
  // void initState() {
  //   //fetchCoin();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Crypto",
          style: TextStyle(
            fontSize: 40,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoritePage(
                      imageUrl:
                          'https://images.unsplash.com/photo-1621416894569-0f39ed31d247?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Yml0Y29pbnxlbnwwfHwwfHw%3D&w=1000&q=80',
                      name: 'bitc',
                    ),
                  )),
              child: Container(
                  height: 20,
                  width: 50,
                  color: Colors.blue,
                  child: Icon(Icons.favorite_border_sharp)),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: ((context, index) {
          return CoinCard(
            imageUrl:
                'https://images.unsplash.com/photo-1621416894569-0f39ed31d247?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Yml0Y29pbnxlbnwwfHwwfHw%3D&w=1000&q=80',
            name: 'bitcoin',
            marketCap: '346',
            symbol: 'dance',
            priceChange: 45,
          );
        }),
      ),
    );
  }
}

class CoinCard extends StatefulWidget {
  String imageUrl;
  String name;
  String marketCap;
  String symbol;
  double priceChange;
  CoinCard({
    required this.imageUrl,
    required this.name,
    required this.marketCap,
    required this.symbol,
    required this.priceChange,
  });

  @override
  State<CoinCard> createState() => _CoinCardState();
}

class _CoinCardState extends State<CoinCard> {
  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(25),
        ),
        child: GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  marketCap: widget.marketCap,
                  symbol: widget.symbol,
                  priceChange: widget.priceChange,
                  imageUrl: widget.imageUrl,
                ),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.blueGrey[400],
                    radius: 40,
                    child: Image.network(
                      widget.imageUrl,
                      height: 38,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.name,
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              SizedBox(
                width: 20,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    tapped = !tapped;
                  });
                },
                icon: tapped
                    ? Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
