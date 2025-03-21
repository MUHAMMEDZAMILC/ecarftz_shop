import 'package:ecarftz_shop/utils/core/helpers/help_loader.dart';
import 'package:ecarftz_shop/utils/core/helpers/help_screensize.dart';
import 'package:ecarftz_shop/utils/core/helpers/pagenavigator.dart';
import 'package:ecarftz_shop/utils/core/utils/theme/colors.dart';
import 'package:ecarftz_shop/utils/core/utils/theme/theme_data.dart';
import 'package:ecarftz_shop/view/ui/home/controller/homeprovider.dart';
import 'package:ecarftz_shop/view/ui/product/view/productdetailscreen.dart';
import 'package:ecarftz_shop/view/ui/whishlist/controller/whishlistprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:provider/provider.dart';

import '../../../../utils/core/utils/theme/dimensions.dart';
import '../../../components/appbutton.dart';
import '../../../components/apptext.dart';
import '../../../components/imageasset.dart';
import '../model/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeProvider>().getproduct(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: context.watch<HomeProvider>().ispageloading?PageEntryLoader(): SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: ScreenUtil.screenWidth,
                height: ScreenUtil.screenHeight! * 0.20,
                child: ExpandableCarousel(
                  options: ExpandableCarouselOptions(
                    autoPlay: true,
                    autoPlayCurve: TreeSliver.defaultAnimationCurve,
                    autoPlayInterval: const Duration(seconds: 5),
                    viewportFraction: 1,
                    showIndicator: false,
                  ),
                  items:
                      context.watch<HomeProvider>().list.map((i) {
                        return Padding(
                          padding: const EdgeInsets.all(paddingLarge),
                          child: Stack(
                            // alignment: AlignmentDirectional.centerStart,
                            children: [
                              Container(
                                width: ScreenUtil.screenWidth,
                                height: ScreenUtil.screenHeight! * 0.18,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ColorResources.CHART_CANCEL,
                                ),
                              ),
                              Positioned(
                                right: -10,
                                bottom: -5,
                                child: ImageAsset(name: i.img!, width: 200),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: padding26,
                                  horizontal: paddingLarge,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    AppText(
                                      text: i.title ?? '',
                                      color: ColorResources.WHITE,
                                      size: 18,
                                      letterspace: 0.5,
                                      weight: FontWeight.w600,
                                    ),
                                    gap21,
                                    ApBtn(
                                      height: 40,
                                      width: ScreenUtil.screenWidth! * 0.4,
                                      buttonStyle: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                          ColorResources.SCAFFOLDBG,
                                        ),
                                        shape: WidgetStatePropertyAll<
                                          RoundedRectangleBorder
                                        >(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              50,
                                            ),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {},
                                      isValid: true,
                                      child: AppText(
                                        text: i.btntext ?? '',
                                        color: ColorResources.WHITE,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(paddingLarge),
                child: GridView.builder(
                  itemCount: context.watch<HomeProvider>().productlist.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.4,
                    crossAxisSpacing: padding,
                    mainAxisSpacing: padding,
                  ),
                  itemBuilder: (context, index) {
                    Product data = context.watch<HomeProvider>().productlist[index];
                    return InkWell(
                      onTap: () {
                        Screen.open(context, ProductDetailsScreen(product: data,));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorResources.BLACKGREY.withOpacity(0.3),
                          ),
                          borderRadius: BorderRadius.circular(paddingLarge),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(padding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ColorResources.BLACKGREY.withOpacity(
                                        0.3,
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(paddingLarge),
                                    image: DecorationImage(
                                      image: NetworkImage(data.image!),
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                              ),
                              gap,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(text: data.title??'', maxline: 2,textalign: TextAlign.left,),
                                    gapTiny,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppText(
                                          text: data.price.toString(),
                                          color: ColorResources.AMTGREEN,
                                          size: 11,
                                          weight: FontWeight.w600,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            context.read<WhishlistProvider>().addorremwhish(data);
                                          },
                                          child: Icon(CupertinoIcons.heart,color:context.watch<WhishlistProvider>().whishlist.contains(data)?primarycolor:null ,))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
