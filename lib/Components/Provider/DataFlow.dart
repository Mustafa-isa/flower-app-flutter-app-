import 'package:flowerapp/Components/Item.dart';
import 'package:flutter/material.dart';

class DataFlow with ChangeNotifier {
  List data = [];
  addToCart(imagePath, productPrice) {
    data.add(Item(imgPath: imagePath, price: productPrice ,id:DateTime.now()));
    notifyListeners();
  }

  getProductCount() {
    return data.length;
  }
}
