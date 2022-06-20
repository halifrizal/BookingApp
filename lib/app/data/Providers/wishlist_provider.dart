import 'package:bookingapp/app/data/models/airplane.dart';
import 'package:bookingapp/app/data/models/produk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WishlistProvider with ChangeNotifier {
  List<Produk> _wishlist = [];

  List<Produk> get wishlist => _wishlist;

  set wishlist(List<Produk> wishlist) {
    _wishlist = wishlist;
    notifyListeners();
  }

  setProduk(Produk produk) {
    if (!isWishlist(produk)) {
      _wishlist.add(produk);
    } else {
      _wishlist.removeWhere((element) => element.id == produk.id);
    }

    notifyListeners();
  }

  isWishlist(Produk produk) {
    if (_wishlist.indexWhere((element) => element.id == produk.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
