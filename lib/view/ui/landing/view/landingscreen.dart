import 'package:ecarftz_shop/utils/core/helpers/help_screensize.dart';
import 'package:ecarftz_shop/utils/core/utils/theme/theme_data.dart';
import 'package:ecarftz_shop/view/components/appbar.dart';
import 'package:ecarftz_shop/view/ui/landing/controller/landingprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: ApBarMn(
        titlename: context.watch<LandingProvider>().currentindex ==0?'Home':context.watch<LandingProvider>().currentindex==1?'WhisList':'Cart',
        titleonly: true,
      ),
      body: context.watch<LandingProvider>().screens.elementAt(context.watch<LandingProvider>().currentindex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primarycolor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: context.watch<LandingProvider>().currentindex,
        onTap: (value) {
          context.read<LandingProvider>().chamgeindex(value);
        },
        items: [
        BottomNavigationBarItem(
          
          icon: Icon(CupertinoIcons.home),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart),label: 'Whishlist'),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.cart),label: 'Cart'),
      ]),
    );
  }
}