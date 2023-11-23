import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class dataText extends ChangeNotifier {
  bool showDetail = false;
  toggleShown() {
    showDetail = !showDetail;
    notifyListeners();
  }
}

class Details extends StatelessWidget {
  List data;
  String? imgPath;
  double? price;
  Details({required this.data, super.key}) {
    imgPath = data[0];
    price = data[1];
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => dataText(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 76, 141, 95),
          title: Text(
            "Details",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                        child: Text(
                          "8",
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(211, 164, 255, 193),
                            shape: BoxShape.circle)),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_shopping_cart,
                          color: Colors.white,
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    "\$ 128",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            )
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(children: [
            Image.asset(imgPath as String),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                '\$ ${price}',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Text(
                            'Now',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          padding: EdgeInsets.all(8),
                          color: Color.fromARGB(255, 1, 108, 1),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Color.fromARGB(255, 255, 191, 0),
                              size: 30,
                            ),
                            Icon(
                              Icons.star,
                              color: Color.fromARGB(255, 255, 191, 0),
                              size: 30,
                            ),
                            Icon(
                              Icons.star,
                              color: Color.fromARGB(255, 255, 191, 0),
                              size: 30,
                            ),
                            Icon(
                              Icons.star,
                              color: Color.fromARGB(255, 255, 191, 0),
                              size: 30,
                            ),
                            Icon(
                              Icons.star,
                              color: Color.fromARGB(255, 255, 191, 0),
                              size: 30,
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.shop,
                          color: Colors.teal[300],
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          'Flower Shop',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ]),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Text(
                "Details :",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Consumer<dataText>(
              builder: (context, dataText, child) {
                return Container(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'A flower, sometimes known as a bloom or blossom, is the reproductive structureflower, sometimes known as a bloom or blossom, is the reproductive structure found in flowering plants (plants of the division Angiospermae). Flowers produce gametophytes, which in flowering plants consist of a few haploid cells that produce gametes.',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                          maxLines: dataText.showDetail == false ? 3 : null,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            dataText.toggleShown();
                          },
                          child: Text(
                            'Show ${dataText.showDetail == false ? "More" : "Less"}',
                            style: TextStyle(fontSize: 20),
                          ))
                    ],
                  ),
                );
              },
            ),
          ]),
        )),
      ),
    );
  }
}
