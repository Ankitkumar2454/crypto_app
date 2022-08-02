import 'package:crypto_app/databaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:crypto_app/coin.dart';

class FavoritePage extends StatefulWidget {
  //static String id = 'favoritepage';

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<Coin> coinDetail = coinList;

  DatabaseHelper _db = DatabaseHelper();
  @override
  void initState() {
    _db.getData().then((value) {
      setState(() {
        coinDetail = value;
      });
    });
    super.initState();
  }

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
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: coinDetail.length,
            itemBuilder: ((context, index) {
              return Card(
                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 10),
                      child: Container(
                        height: 40,
                        width: 50,
                        child: Image.network(
                          coinDetail[index].imageUrl,
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: Text(
                        coinDetail[index].name,
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: (() {
                        _db.DeleteData(index);
                        print(index);
                        _db.getData().then((value) {
                          coinDetail = value;
                        });
                        print('tapped deleted');
                      }),
                      child: Container(
                        height: 35,
                        color: Colors.indigo,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            'remove',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ),
                      ),
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
