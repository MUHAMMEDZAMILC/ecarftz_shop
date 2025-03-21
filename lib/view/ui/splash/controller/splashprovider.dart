import 'dart:async';

import 'package:ecarftz_shop/utils/core/helpers/pagenavigator.dart';
import 'package:ecarftz_shop/view/ui/landing/view/landingscreen.dart';
import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  
  initsplash(BuildContext context) async {
    Timer(Duration(seconds: 3), () {
      Screen.openAsNewPage(context, LandingScreen());
    },);
  }
}