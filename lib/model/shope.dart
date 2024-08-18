import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

import 'food.dart';

class Shop extends ChangeNotifier {
  // food menu

  final List<Food> _foodMenu = [
    Food(
        name: "Salmon Sushi",
        price: "Rp. 50.000",
        imagePath: "images/sushi-roll.png",
        rating: "4.9"),
    Food(
        name: "Maki",
        price: "Rp. 30.000",
        imagePath: "images/maki.png",
        rating: "4.9"),
    Food(
        name: "Salmon",
        price: "Rp. 30.000",
        imagePath: "images/salmon.png",
        rating: "4.9")
  ];
  //costemer  cart

  List<Food> _cart = [];

  // getter method
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // add to cart

  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
