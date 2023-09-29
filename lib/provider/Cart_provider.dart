// ignore: file_names
import 'package:e_commerce_app/model/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  // data will store in list
  final List<Product> _cart = [];
  List<Product> get cart => _cart;

  // to add to cart
  void toggleproduct(Product product) {
    if (_cart.contains(product)) {
      for (Product element in _cart) {
        element.quantity++;
      }
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  // to increment qunatitiy
  incrementQuantity(int index) {
    return _cart[index].quantity++;
  }

  // to dicrement qunatitiy
  decrementQuantity(int index) {
    return _cart[index].quantity--;
  }

  // to get totlal price after for additons
  getTotalPrice() {
    double total = 0.0;
    for (Product element in _cart) {
      total += element.price * element.quantity;
    }
    return total;
  }

  // to build context and listen in provider
  static CartProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<CartProvider>(context, listen: listen);
  }
}
