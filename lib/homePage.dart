import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:crypto_app/coin.dart';
import 'package:crypto_app/databaseHelper.dart';
import 'package:crypto_app/detailPage.dart';
import 'package:crypto_app/favoritePage.dart';

class HomePage extends StatefulWidget {
  static String id = 'homepage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Coin>> fetchCoin() async {
    coinList = [];
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'));

    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinList.add(Coin.fromJson(map));
          }
        }
        setState(() {
          coinList;
        });
      }
      return coinList;
    } else {
      throw Exception('Failed to load coins');
    }
  }

  @override
  void initState() {
    fetchCoin();
    Timer.periodic(Duration(seconds: 10), (timer) => fetchCoin());

    super.initState();
  }

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
                    builder: (context) => FavoritePage(),
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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: coinList.length,
                  itemBuilder: (context, index) {
                    var finallist = coinList[index]; //shortcut
                    if (index > 0) {
                      return CoinCard(
                        name: coinList[index].name,
                        symbol: coinList[index].symbol,
                        imageUrl: coinList[index].imageUrl,
                        marketcap: coinList[index].marketcap.toDouble(),
                        pricechange: coinList[index].pricechange.toDouble(),
                        changePercentage:
                            coinList[index].changePercentage.toDouble(),
                        list: finallist,
                      );
                    } else {
                      return Container();
                    }
                  },
                )),
          ),
        ],
      ),
    );
  }
}

class CoinCard extends StatefulWidget {
  CoinCard({
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.marketcap,
    required this.pricechange,
    required this.changePercentage,
    required this.list,
  });

  String name;
  String symbol;
  String imageUrl;
  double marketcap;
  double pricechange;
  double changePercentage;
  Coin list;

  @override
  State<CoinCard> createState() => _CoinCardState();
}

class _CoinCardState extends State<CoinCard> {
  DatabaseHelper _db = DatabaseHelper();
  bool tapped = false;
  int DataId = 0;
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
                  marketCap: widget.marketcap,
                  symbol: widget.symbol,
                  changePercentage: widget.changePercentage,
                ),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
              Container(
                width: 200,
                child: Text(
                  widget.name,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              IconButton(
                onPressed: () async {
                  DataId = await _db.insertData(widget.list);
                  print('data inserted');
                  setState(() {
                    tapped = !tapped;
                  });
                  //print('${DataId}');
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
