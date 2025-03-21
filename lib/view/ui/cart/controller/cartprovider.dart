import 'dart:developer';

import 'package:ecarftz_shop/controller/apiservice.dart';
import 'package:ecarftz_shop/view/ui/cart/model/cart_model.dart';
import 'package:ecarftz_shop/view/ui/home/model/product_model.dart';
import 'package:flutter/material.dart';

import '../../../../controller/api/urls.dart';

class CartProvider extends ChangeNotifier {
  bool ispageloading = true;


  List<Product> cartlist = [];
  addorremcart(Product product) async {
    if (cartlist.contains(product)) {
      cartlist.remove(product);
    }else{
      cartlist.add(product);
      
    }
    notifyListeners();
  }
}