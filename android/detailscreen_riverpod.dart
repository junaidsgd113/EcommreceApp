import 'package:ecommerceapp/core/model/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';


final detailscreenprovider =
    StateNotifierProvider<Detailscreen, List<Product>>((ref) => Detailscreen());

class Detailscreen extends StateNotifier<List<Product>> {
  Detailscreen([List<Product>? intialDetailscreen]) : super(intialDetailscreen ?? []);


  int quantity = 1;


  void incresesegmentedvalue() {
    
    if (quantity < 10) {
      quantity++;
    } else {
      Fluttertoast.showToast(
          msg: 'value must be less than 10', backgroundColor: Colors.red);
    }
  }

  void decresesegmentedvalue() {
    if (quantity > 1) {
      quantity--;
    }
  }

  void resetquentity() {
    quantity = 1;
  }
}
