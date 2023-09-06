import 'package:e_commerce/controllers/popular_product_controllers.dart';
import 'package:e_commerce/utilities/app_constants.dart';
import 'package:e_commerce/utilities/dimensions.dart';
import 'package:e_commerce/widgets/app_icon.dart';
import 'package:e_commerce/widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';

import '../../routes/page_routes.dart';
import '../../utilities/colors.dart';
import '../../widgets/app_column.dart';
import '../../widgets/big_text.dart';
import 'package:get/get.dart';


class PopularFoodDetails extends StatelessWidget {
  int pageId;
  PopularFoodDetails({required this.pageId,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =Get.find<PopularProductController>().popularProductList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
        body: Stack(
          children: [
            //Background Image
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: Dimensions.popularFoodHeight,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                        image: NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!)
                    )
                  ),
                )),

            //Icon widgets
            Positioned(
                top: Dimensions.height45,
                left: Dimensions.width20,
                right: Dimensions.width20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                          onTap: ()=>Get.toNamed(PageRoutes.getInitial()),
                          child: const AppIcons(icon: Icons.arrow_back_ios)),
                    const AppIcons(icon: Icons.shopping_cart_outlined)
                  ],

            )),

            //Food Introduction
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: Dimensions.popularFoodHeight - Dimensions.height30,
                child: Container(
                  padding: EdgeInsets.only(left: Dimensions.height20,
                    right: Dimensions.height20,
                    top: Dimensions.height20
                     ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20)
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(text: product.name!,),
                      SizedBox(height: Dimensions.height20,),
                      const BigText(text: "Introduce"),
                       SizedBox(height: Dimensions.height20,),
                       Expanded(
                         child: SingleChildScrollView(
                             child: ExpandableText(text: product.description!)),
                       )
                    ],
                  )
                ),
            )

            //Expandable widgets

          ],
        ),
      bottomNavigationBar: Container(
        height: Dimensions.pageView140,
        padding: EdgeInsets.only(
          top: Dimensions.height30,
          bottom: Dimensions.height30,
          left: Dimensions.width20,
          right: Dimensions.width20
        ),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20 * 2),
            topRight: Radius.circular(Dimensions.radius20 * 2)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20,
              bottom: Dimensions.height20,
              left: Dimensions.width20,
              right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.remove,color: AppColors.signColor,),
                  SizedBox(width: Dimensions.height10/2,),
                  const BigText(text: "0"),
                  SizedBox(width: Dimensions.height10/2,),
                  const Icon(Icons.add,color: AppColors.signColor,)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height30,
                  bottom: Dimensions.height30,
                  left: Dimensions.width20,
                  right: Dimensions.width20
              ),
              child: BigText(text: "\$ ${product.price!}| Add to cart",color: Colors.white,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor
              ),
            )
          ],
        ),
      ),
    );
  }
}
