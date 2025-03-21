import 'package:ecarftz_shop/utils/core/helpers/help_datepicker.dart';
import 'package:ecarftz_shop/utils/core/helpers/help_loader.dart';
import 'package:ecarftz_shop/utils/core/helpers/help_nodata.dart';
import 'package:ecarftz_shop/utils/core/helpers/help_screensize.dart';
import 'package:ecarftz_shop/utils/core/utils/theme/dimensions.dart';
import 'package:ecarftz_shop/view/components/apptext.dart';
import 'package:ecarftz_shop/view/ui/cart/controller/cartprovider.dart';
import 'package:ecarftz_shop/view/ui/cart/model/cart_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/core/utils/theme/colors.dart';
import '../../../../utils/core/utils/theme/theme_data.dart';
import '../../home/model/product_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: context.watch<CartProvider>().cartlist.isEmpty?PgNoData(): SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child:Column(
          children: [
             Padding(
                padding: const EdgeInsets.all(paddingLarge),
                child: GridView.builder(
                  itemCount: context.watch<CartProvider>().cartlist.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.4,
                    crossAxisSpacing: padding,
                    mainAxisSpacing: padding,
                  ),
                  itemBuilder: (context, index) {
                    Product data = context.watch<CartProvider>().cartlist[index];
                    return Container(
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
                                          context.read<CartProvider>().addorremcart(data);
                                        },
                                        child: Icon(CupertinoIcons.delete,color: primarycolor,))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        )
      ),
    );
  }
}