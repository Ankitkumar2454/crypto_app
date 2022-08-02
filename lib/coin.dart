import 'dart:convert';

class Coin {
  Coin({
    this.id,
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.marketcap,
    required this.pricechange,
    required this.changePercentage,
  });
  String? id;
  String name;
  String symbol;
  String imageUrl;
  num marketcap;
  num pricechange;
  num changePercentage;

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      //id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      imageUrl: json['image'],
      marketcap: json['market_cap'],
      pricechange: json['price_change_24h'],
      changePercentage: json['price_change_percentage_24h'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'symbol': symbol,
      'imageUrl': imageUrl,
      'marketcap': marketcap,
      'pricechange': pricechange,
      'changePercentage': changePercentage,
    };
  }
}

List<Coin> coinList = [];
