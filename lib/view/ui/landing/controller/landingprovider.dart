import 'package:ecarftz_shop/view/ui/cart/view/cartscreen.dart';
import 'package:ecarftz_shop/view/ui/home/view/homescreen.dart';
import 'package:ecarftz_shop/view/ui/whishlist/view/whishlistscreen.dart';
import 'package:flutter/material.dart';

class LandingProvider extends ChangeNotifier {
int currentindex = 0;

  chamgeindex(index) {
    currentindex = index;
    notifyListeners();
  }

  List screens = [HomeScreen(),WidhListScreen(),CartScreen()];
}