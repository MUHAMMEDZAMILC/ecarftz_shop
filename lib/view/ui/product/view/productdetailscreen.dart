import 'package:ecarftz_shop/utils/core/helpers/help_screensize.dart';
import 'package:ecarftz_shop/utils/core/utils/theme/colors.dart';
import 'package:ecarftz_shop/view/components/appbar.dart';
import 'package:ecarftz_shop/view/components/apptext.dart';
import 'package:ecarftz_shop/view/ui/cart/controller/cartprovider.dart';
import 'package:ecarftz_shop/view/ui/home/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/core/utils/theme/dimensions.dart';
import '../../../../utils/core/utils/theme/theme_data.dart';
import '../../whishlist/controller/whishlistprovider.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key, required this.product});
  Product product;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: ApBarMn(
        titlename: product.title ?? '',
        titleonly: true,
        isback: true,
      ),
      body: SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child: Column(
          children: [
            Container(
              width: ScreenUtil.screenWidth,
              height: ScreenUtil.screenHeight! * 0.6,

              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(product.image!),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            gap,
            Padding(
              padding: const EdgeInsets.all(paddingLarge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(text: product.title ?? '',maxline: 2,),
                  gap,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: product.price.toString(),
                        color: ColorResources.AMTGREEN,
                        size: 20,
                      ),
                      

                      Row(
                        children: [
                          InkWell(
                        onTap: () {
                          context.read<WhishlistProvider>().addorremwhish(
                            product,
                          );
                        },
                        child: Icon(
                          CupertinoIcons.heart,
                          color:
                              context
                                      .watch<WhishlistProvider>()
                                      .whishlist
                                      .contains(product)
                                  ? primarycolor
                                  : null,
                        ),
                      ),gapHorizontal,
                          InkWell(
                            onTap: () {
                              context.read<CartProvider>().addorremcart(
                                product,
                              );
                            },
                            child: Icon(
                              CupertinoIcons.cart,
                              color:
                                  context
                                          .watch<CartProvider>()
                                          .cartlist
                                          .contains(product)
                                      ? primarycolor
                                      : null,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
