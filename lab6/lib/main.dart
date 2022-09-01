import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double gamenewprice = 0;
  void gamesNewPricesList(double salePercent) {
    for (var i = 0; i < 10; i++) {
      gamenewprice = gamesPrices[i] * (salePercent / 100);
      gamesNewPrices.add(gamenewprice);
    }
  }

  List gamesPrices = [60.9, 60.15, 60.15, 60.15, 70.17];
  List gamesNewPrices = [17.3, 15.7, 22.6, 34.8, 40.17];

  List gameName = [
    "Battlefield 2042",
    "Cyberpunk 2077",
    "Destiny 2",
    "F1 22",
    "Fifa 23"
  ];
  List myimages = [
    "images/Battlefield.png",
    "images/Cyberpunk.png",
    "images/Destiny2.png",
    "images/f122.png",
    "images/Fifa.png",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 62, 1, 143),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 187, 79, 250),
              Color.fromARGB(255, 111, 0, 166),
              Color.fromARGB(255, 13, 8, 8),
            ],
          )),
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, i) {
                return ListTile(
                  title: IconButton(
                    iconSize: 30,
                    icon: const Icon(Icons.shopping_cart),
                    color: Colors.white,
                    alignment: Alignment.topLeft,
                    tooltip: 'Add To the Cart',
                    onPressed: () {
                      setState(() {
                        gameName[i] = gameName[i]+ " \n Added To the Cart ";
                      });
                    },
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image(
                        image: AssetImage(myimages[i]),
                        width: 140,
                        height: 140,
                        alignment: Alignment.bottomLeft,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Text(
                                  gameName[i],
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                               
                              ],
                            ),
                            alignment: Alignment.topLeft,
                          ),
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  gamesPrices[i].toString(),
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 252, 0, 0),
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                child: Text(gamesNewPrices[i].toString(),
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 169, 8),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                alignment: Alignment.topLeft,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    iconSize: 30,
                    icon: const Icon(Icons.favorite_rounded),
                    color: Colors.white,
                    alignment: Alignment.topLeft,
                    tooltip: 'Add To the Cart',
                    onPressed: () {
                      setState(() {
                       gameName[i] = gameName[i]+ " \n Added to Fav";
                      });
                    },
                  ),
                  
                );
              }),
        ),
      ),
    );
  }
}
