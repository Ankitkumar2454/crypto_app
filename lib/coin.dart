import 'package:flutter/material.dart';

class Coin {
  String imageUrl;
  String name;
  String marketCap;
  String symbol;
  double priceChange;
  Coin({
    required this.imageUrl,
    required this.name,
    required this.marketCap,
    required this.symbol,
    required this.priceChange,
  });
}

List<Coin> coinList = [];
