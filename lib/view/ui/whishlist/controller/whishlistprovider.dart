import 'package:ecarftz_shop/view/ui/home/model/product_model.dart';
import 'package:flutter/material.dart';

class WhishlistProvider extends ChangeNotifier {
  bool ispageloading = true;

  List<Product> whishlist = [];
  addorremwhish(Product product) async {
    if (whishlist.contains(product)) {
      whishlist.remove(product);
    }else{
      whishlist.add(product);
    }
    notifyListeners();
  }
}