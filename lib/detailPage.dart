import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  static String id = 'detailpage';
  String marketCap;
  String symbol;
  double priceChange;
  String imageUrl;
  DetailPage({
    required this.marketCap,
    required this.symbol,
    required this.priceChange,
    required this.imageUrl,
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
          color: Colors.grey[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                  height: 100,
                  color: Colors.grey[600],
                  child: Image.network(imageUrl)),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      color: Colors.grey[600],
                      child: Text(
                        'Symbol=  $symbol',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      color: Colors.grey[600],
                      child: Text(
                        'marketCap=  $marketCap',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      color: Colors.grey[600],
                      child: Text(
                        'priceChange= ${priceChange.toDouble() < 0 ? '-' + priceChange.toDouble().toString() : '+' + priceChange.toDouble().toString()}',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
