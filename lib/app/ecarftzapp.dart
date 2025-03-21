import 'package:ecarftz_shop/utils/appcontants/appconstants.dart';
import 'package:ecarftz_shop/utils/core/utils/theme/theme_data.dart';
import 'package:ecarftz_shop/view/ui/cart/controller/cartprovider.dart';
import 'package:ecarftz_shop/view/ui/home/controller/homeprovider.dart';
import 'package:ecarftz_shop/view/ui/landing/controller/landingprovider.dart';
import 'package:ecarftz_shop/view/ui/splash/controller/splashprovider.dart';
import 'package:ecarftz_shop/view/ui/splash/view/splashscreen.dart';
import 'package:ecarftz_shop/view/ui/whishlist/controller/whishlistprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EcraftzShopApp extends StatelessWidget {
  const EcraftzShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SplashProvider(),),
        ChangeNotifierProvider(create: (context) => LandingProvider(),),
        ChangeNotifierProvider(create: (context) => HomeProvider(),),
        ChangeNotifierProvider(create: (context) => CartProvider(),),
        ChangeNotifierProvider(create: (context) => WhishlistProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appname,
        theme: MyTheme.theme,
        home: SplashScreen(),
      ),
    );
  }
}