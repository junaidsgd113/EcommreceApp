import 'package:ecommerceapp/core/service/isar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/wishlistmodel.dart';


final filterProvider = ChangeNotifierProvider<WishListFilterscreenNotifier>((ref) {
  return WishListFilterscreenNotifier();
});

class WishListFilterscreenNotifier extends ChangeNotifier {
  List<WishListModel> _wishlistAll = [];
  final List<WishListModel> _phonelist = [];
  final List<WishListModel> _laptoplist = [];
  final List<WishListModel> _perfumelist = [];
  final List<WishListModel> _serumlist = [];

   List<WishListModel> get wishlistAll => _wishlistAll;
  List<WishListModel> get phonelist => _phonelist;
  List<WishListModel> get laptoplist => _laptoplist;
  List<WishListModel> get perfumelist => _perfumelist;
  List<WishListModel> get serumelist => _serumlist;
  final isarservice=IsarService();
     void getFavoriteProductfromisar() async {
    _wishlistAll = await isarservice.getFavoriteproductfromisar();
  }
    void addproducttowishlist(WishListModel product) {
    _wishlistAll.add(product);
    _laptoplist.add(product);
    _phonelist.add(product);
     _serumlist.add(product);
      _perfumelist.add(product);
      isarservice.addFavoriteproducttoisar(product);
    notifyListeners();
  }
   
   void removeproductfromWishlistpage(int id,WishListModel product) {
    _wishlistAll.removeWhere((element) => element.isarId == id);
    _phonelist.removeWhere((element) => element.isarId == id);
    _laptoplist.removeWhere((element) => element.isarId == id);
    _perfumelist.removeWhere((element) => element.isarId == id);
    _serumlist.removeWhere((element) => element.isarId == id);
  isarservice.deleteFavoriteproductfromisar(product);
    notifyListeners();
  }
  void removeproductfromWishlist(WishListModel product) {
    _wishlistAll.remove(product);
    _phonelist.remove(product);
    _laptoplist.remove(product);
    _perfumelist.remove(product);
    _serumlist.remove(product);
    isarservice.deleteFavoriteproductfromisar(product);
    notifyListeners();
  }
 void smartphoneFilter() {
    for (var prod in _wishlistAll) {
      if (prod.category == "smartphones" && !_phonelist.contains(prod)) {
        _phonelist.add(prod);
      }
      notifyListeners();
    }
  }

  void laptopFilter() {
    for (var prod in _wishlistAll) {
      if (prod.category == "laptops" && !_laptoplist.contains(prod)) {
        _laptoplist.add(prod);
      }
      notifyListeners();
    }
  }

  void perfumeFilter() {
    for (var prod in _wishlistAll) {
      if (prod.category == "fragrances" && !_perfumelist.contains(prod)) {
        _perfumelist.add(prod);
      }
      notifyListeners();
    }
  }

  void skincareFilter() {
    for (var prod in _wishlistAll) {
      if (prod.category == "skincare" && !_serumlist.contains(prod)) {
        _serumlist.add(prod);
      }
      notifyListeners();
    }
  }
  bool isProductInWishlist(String productId) {
    return _wishlistAll.any((product) => product.uuid == productId);
  }
}