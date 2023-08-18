import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

final detailscreenProvider = ChangeNotifierProvider<DetailscreenNotifier>((ref) {
  return DetailscreenNotifier();
});

class DetailscreenNotifier extends ChangeNotifier {
  int quantity = 1;

  void incresesegmentedvalue() {
    if (quantity < 10) {
      quantity++;
    } else {
      Fluttertoast.showToast(
          msg: 'value must be less than 10', backgroundColor: Colors.red);
    }
    notifyListeners();
  }

  void decresesegmentedvalue() {
    if (quantity > 1) {
      quantity--;
    }
    notifyListeners();
  }

  void resetquentity() {
    quantity = 1;
  }
}
