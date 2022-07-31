import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  static String id = 'detailpage';
  double marketCap;
  String symbol;
  double changePercentage;

  DetailPage({
    required this.marketCap,
    required this.symbol,
    required this.changePercentage,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            "detailed page",
            style: TextStyle(
              fontSize: 40,
            ),
          ),
        ),
        body: Container(
          color: Colors.pink,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  color: Colors.grey[600],
                  child: Text(
                    'Symbol:  $symbol',
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  color: Colors.grey[600],
                  child: Text(
                    'marketCap:  $marketCap',
                    style: TextStyle(
                      fontSize: 45,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  color: Colors.grey[600],
                  child: Text(
                    'priceChange24hr%= ${changePercentage.toDouble() < 0 ? '-' + changePercentage.toDouble().toString() + '%' : '+' + changePercentage.toDouble().toString() + '%'}',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
