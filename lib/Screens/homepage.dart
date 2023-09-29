import 'package:e_commerce_app/Screens/pages/Favourite_SCreen.dart';
import 'package:e_commerce_app/Screens/pages/home_Screen.dart';
import 'package:e_commerce_app/Screens/pages/cart_Screen.dart';
import 'package:e_commerce_app/provider/randomprovider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // here we  have call these   screens
  // ignore: non_constant_identifier_names
  List Screens = [
    const HomeScreen(),
    const FavouiteScreen(),
    const CartScreen()
  ];
  @override
  Widget build(BuildContext context) {
    final provider = ScreenChangeProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text(
          "E-commerce App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      // this is bottom bar home like home, favourite and cart
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        currentIndex: provider.counter,
        onTap: (value) {
          provider.ChangeScreen(value);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_checkout), label: "Cart"),
        ],
      ),
      body: Screens[provider.counter],
    );
  }
}
