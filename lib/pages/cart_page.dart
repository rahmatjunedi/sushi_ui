import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restoran_ui/component/button.dart';
import 'package:sushi_restoran_ui/model/shope.dart';
import 'package:sushi_restoran_ui/theme/colors.dart';
import 'package:sushi_restoran_ui/model/food.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  void removeFromCart(Food food, BuildContext context) {
    final shop = context.read<Shop>();
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
        builder: (context, value, child) => Scaffold(
              backgroundColor: primaryColor,
              appBar: AppBar(
                title: Text("Cart"),
                backgroundColor: primaryColor,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: value.cart.length,
                        itemBuilder: (context, index) {
                          final Food food = value.cart[index];
                          final String foodName = food.name;
                          final String foodPrice = food.price;
                          return Container(
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(8)),
                            margin:
                                EdgeInsets.only(left: 20, right: 20, top: 20),
                            child: ListTile(
                              title: Text(
                                foodName,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                foodPrice,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: IconButton(
                                  onPressed: () =>
                                      removeFromCart(food, context),
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  )),
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: MyButton(text: "Pay Now", onTap: () {}),
                  )
                ],
              ),
            ));
  }
}
