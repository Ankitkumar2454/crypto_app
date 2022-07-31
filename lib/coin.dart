class Coin {
  Coin({
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.marketcap,
    required this.pricechange,
    required this.changePercentage,
  });

  String name;
  String symbol;
  String imageUrl;
  num marketcap;
  num pricechange;
  num changePercentage;

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      name: json['name'],
      symbol: json['symbol'],
      imageUrl: json['image'],
      marketcap: json['market_cap'],
      pricechange: json['price_change_24h'],
      changePercentage: json['price_change_percentage_24h'],
    );
  }
}

List<Coin> coinList = [];
List<String> favoriteDataList = [];//last remove
