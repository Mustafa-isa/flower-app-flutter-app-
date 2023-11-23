import 'package:flowerapp/Components/Provider/DataFlow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key});

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
          Consumer<DataFlow>(builder: (context, dataFlow, child) {
            return Row(
              children: [
                Stack(
                  children: [
                    Container(
                        child: Text(
                          "${dataFlow.getProductCount()}",
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
            );
          })
        ],
      ),
      body: Consumer<DataFlow>(builder: (context, dataFlow, child) {
        return ListView.builder(
          itemCount: dataFlow.data.length,
          itemBuilder: (BuildContext context, int index) {
            // Replace the following with your custom widget or UI for each item
            return ListTile(
              title:Image.asset(dataFlow.data[index].imgPath),
              subtitle: Text("\$ ${dataFlow.data[index].price.toString()}"),
              // Add more customization as needed
            );
          },
        );
      }),
    );
  }
}

