import 'package:e_commerce/controllers/recommended_product_controllers.dart';
import 'package:e_commerce/routes/page_routes.dart';
import 'package:e_commerce/utilities/app_constants.dart';
import 'package:e_commerce/utilities/colors.dart';
import 'package:e_commerce/utilities/dimensions.dart';
import 'package:e_commerce/widgets/app_icon.dart';
import 'package:e_commerce/widgets/big_text.dart';
import 'package:e_commerce/widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendedFoodDetails extends StatelessWidget {
  final int pageId;
  const RecommendedFoodDetails({required this.pageId,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: ()=>Get.toNamed(PageRoutes.getInitial()),
                    child: AppIcons(icon: Icons.clear)),
                const AppIcons(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(

                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5,bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20)

                  )
                ),
                child: Center(
                  child: BigText(size: Dimensions.font26,text: product.name!,),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.buttonBackgroundColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!,
              width: double.maxFinite,
              fit: BoxFit.cover,
              ),

            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
                    child: ExpandableText(text: product.description!,),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: Dimensions.width20*2.5,
                right: Dimensions.width20,
                top: Dimensions.height10,
                bottom: Dimensions.height10
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcons(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor:AppColors.mainColor,
                    icon: Icons.remove
                ),
                BigText(
                    text: "\$ ${product.price!}" "X" "0",
                    color: AppColors.mainBlackColor,
                    size: Dimensions.font26,
                ),
                AppIcons(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor:AppColors.mainColor,
                    icon: Icons.add)
              ],
            ),
          ),
          Container(
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
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  )
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height30,
                      bottom: Dimensions.height30,
                      left: Dimensions.width20,
                      right: Dimensions.width20
                  ),
                  child: const BigText(text: "\$10 | Add to cart",color: Colors.white,),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
