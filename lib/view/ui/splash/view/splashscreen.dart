import 'package:ecarftz_shop/utils/appcontants/appconstants.dart';
import 'package:ecarftz_shop/utils/core/helpers/help_screensize.dart';
import 'package:ecarftz_shop/utils/core/utils/extension/upperfstring_ext.dart';
import 'package:ecarftz_shop/view/components/apptext.dart';
import 'package:ecarftz_shop/view/ui/splash/controller/splashprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<SplashProvider>().initsplash(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(text: AppConstants.appname.upperFull)
          ],
        ),
      ),
    );
  }
}