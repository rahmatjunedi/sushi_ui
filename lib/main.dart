import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restoran_ui/model/shope.dart';
import 'package:sushi_restoran_ui/pages/cart_page.dart';
import 'package:sushi_restoran_ui/pages/intro_page.dart';
import 'package:sushi_restoran_ui/pages/menu_page.dart';

// https://www.youtube.com/watch?v=zOQzu3BGSqo&t=1135s
void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntoPage(),
      routes: {
        '/intropage': (context) => const IntoPage(),
        '/menupage': (context) => const MenuPage(),
        '/cartpage': (context) => const CartPage(),
      },
    );
  }
}
