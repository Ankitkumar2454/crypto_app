import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  static String id = 'detailpage';
  String marketCap;
  String symbol;
  double priceChange;
  DetailPage({
    required this.marketCap,
    required this.symbol,
    required this.priceChange,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              symbol,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              marketCap,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              priceChange.toDouble().toString(),
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
