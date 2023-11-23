import 'package:flowerapp/Components/Item.dart';
import 'package:flowerapp/Components/Provider/DataFlow.dart';
import 'package:flowerapp/Page/Ceckout.dart';
import 'package:flowerapp/Page/Details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final List<Item> items = [
    Item(price: 12.99, imgPath: "assets/images/1.webp"),
    Item(price: 23.99, imgPath: "assets/images/2.webp"),
    Item(price: 122.0, imgPath: "assets/images/3.webp"),
    Item(price: 123.99, imgPath: "assets/images/4.webp"),
    Item(price: 12.99, imgPath: "assets/images/5.webp"),
    Item(price: 62.99, imgPath: "assets/images/6.webp"),
    Item(price: 52.99, imgPath: "assets/images/7.webp"),
    Item(price: 32.99, imgPath: "assets/images/8.webp"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 76, 141, 95),
        title: Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Consumer<DataFlow>(builder: (context, DataFlow, child) {
            return Row(
              children: [
                Stack(
                  children: [
                    Container(
                        child: Text(
                          "${DataFlow.getProductCount()}",
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(211, 164, 255, 193),
                            shape: BoxShape.circle)),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Checkout()));
                        },
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
            );
          })
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/backgroundImage.avif"),
                        fit: BoxFit.cover),
                  ),
                  accountName: Text("Mustafa Eisa",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                      )),
                  accountEmail: Text("ali@yahoo.com"),
                  currentAccountPictureSize: Size.square(99),
                  currentAccountPicture: CircleAvatar(
                      radius: 55,
                      backgroundImage:
                          AssetImage("assets/images/5.webp")),
                ),
                ListTile(
                    title: Text("Home"),
                    leading: Icon(Icons.home),
                    onTap: () {}),
                ListTile(
                    title: Text("My products"),
                    leading: Icon(Icons.add_shopping_cart),
                    onTap: () {}),
                ListTile(
                    title: Text("About"),
                    leading: Icon(Icons.help_center),
                    onTap: () {}),
                ListTile(
                    title: Text("Logout"),
                    leading: Icon(Icons.exit_to_app),
                    onTap: () {}),
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 17),
              child: Text("Developed by Mustafa Eisa",
                  style: TextStyle(fontSize: 16, color: Colors.black)),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4 / 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return GridTile(
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Details(data: [
                                    items[index].imgPath,
                                    items[index].price
                                  ])));
                    },
                    // use ClipRRect & Positioned
                    child: ClipRect(
                        child: Image.asset(items[index].imgPath as String))),
                footer: GridTileBar(
                  backgroundColor: Color.fromARGB(66, 73, 127, 110),
                  trailing: Consumer<DataFlow>(
                    builder: (context, DataFlow, child) {
                      return IconButton(
                          color: Color.fromARGB(255, 62, 94, 70),
                          onPressed: () {
                            DataFlow.addToCart(
                                items[index].imgPath, items[index].price);
                          },
                          icon: Icon(Icons.add));
                    },
                  ),
                  leading: Text("\$ ${items[index].price}"),
                  title: Text(
                    "",
                  ),
                ),
              );
            }),
      ),
    );
  }
}
