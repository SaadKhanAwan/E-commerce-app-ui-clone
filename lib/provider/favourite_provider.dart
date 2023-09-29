import 'package:e_commerce_app/model/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteProvider extends ChangeNotifier {
  final List<Product> _favourite = [];
  List<Product> get favourite => _favourite;

  // to add to favourite
  void troggleFavourite(Product product) {
    if (_favourite.contains(product)) {
      _favourite.remove(product);
    } else {
      _favourite.add(product);
    }
    notifyListeners();
  }

  // tpo already exist in favourite
  bool isExist(Product product) {
    final isExist = _favourite.contains(product);
    return isExist;
  }

  // to build context and listen true
  static FavouriteProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<FavouriteProvider>(context, listen: listen);
  }
}
