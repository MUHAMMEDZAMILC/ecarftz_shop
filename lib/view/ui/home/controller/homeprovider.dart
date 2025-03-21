import 'dart:developer';

import 'package:ecarftz_shop/controller/api/urls.dart';
import 'package:ecarftz_shop/controller/apiservice.dart';
import 'package:ecarftz_shop/view/ui/home/model/product_model.dart';
import 'package:flutter/material.dart';

import '../model/homecaro_model.dart';

class HomeProvider extends ChangeNotifier {
  bool ispageloading = true;
  List<HomeCaro> list = [
    HomeCaro(
      title: 'Explore Sport Shoes',
      img: 'sports.png',
      btntext: 'Explore',
    ),
    HomeCaro(
      title: 'Premium Casio Watches',
      img: 'watches.png',
      btntext: 'Buy Now',
    ),
  ];

  List<Product> productlist = [];
  getproduct(BuildContext context) async {
    try {
      var json = await Api.call(
        context,
        endPoint: getproductUrl,
        method: Method.get,
      );
      productlist = productFromJson(json);
     
    } catch (e) {
      log(e.toString());
      
    }
    ispageloading = false;
    notifyListeners();
  }
}
