import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenChangeProvider extends ChangeNotifier {
  // ignore: non_constant_identifier_names
  int _current_index = 0;
  int get counter => _current_index;

  // to change screens providnig index
  // ignore: non_constant_identifier_names
  ChangeScreen(value) {
    _current_index = value;
    notifyListeners();
  }

  static ScreenChangeProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<ScreenChangeProvider>(context, listen: listen);
  }
}
