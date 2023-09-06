import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce/controllers/popular_product_controllers.dart';
import 'package:e_commerce/controllers/recommended_product_controllers.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/routes/page_routes.dart';
import 'package:e_commerce/utilities/app_constants.dart';
import 'package:e_commerce/utilities/colors.dart';
import 'package:e_commerce/utilities/dimensions.dart';
import 'package:e_commerce/widgets/big_text.dart';
import 'package:e_commerce/widgets/icon_and_text.dart';
import 'package:e_commerce/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/app_column.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var currentValue = 0.0;
  double scaleFactor = 0.8;
  double height = Dimensions.firstContainer;
  List images = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentValue = pageController.page!;
      });
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProductController>(
          builder: (popularProducts) {
            return popularProducts.isLoaded?SizedBox(
              height: 320,
                child: PageView.builder(
                    controller: pageController,
                    itemCount: popularProducts.popularProductList.length,
                    itemBuilder: (context, index) {
                      return _buildPageItem(index, popularProducts.popularProductList[index]);
                    }),
            ):const CircularProgressIndicator(
              color: AppColors.mainColor,
            );

          }),
        GetBuilder<PopularProductController>(
          builder: (popularProducts){
            return DotsIndicator(
              dotsCount: popularProducts.popularProductList.isEmpty?1:popularProducts.popularProductList.length,
              position: currentValue.floor(),
              decorator: DotsDecorator(
                activeColor: AppColors.mainColor,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              ),
            );
       }

        ),
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const BigText(text: 'Recommended'),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: const BigText(text: '.',color: Colors.black26,),
              ),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                  child: const SmallText(text: 'Food pairing')
              )
            ],
          ),
        ),
        //List of foods
        GetBuilder<RecommendedProductController>(
          builder: (recommendedProducts){
            return recommendedProducts.isLoaded?ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: recommendedProducts.recommendedProductList.length,
                itemBuilder: (context,index)=>
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(PageRoutes.getRecommendedFood(index));
                      },
                      child: Container(
                        margin:  EdgeInsets.only(left: Dimensions.width20,right: Dimensions.right20,bottom: Dimensions.height10),
                        child: Row(
                          children: [
                            //Image section
                            Container(
                              height: Dimensions.pageView140,
                              width: Dimensions.pageView140,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                                  color: Colors.white38,
                                  image: DecorationImage(
                                      image: NetworkImage(AppConstants.BASE_URL + AppConstants.UPLOAD_URL + recommendedProducts.recommendedProductList[index].img),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            //Text section
                            Expanded(
                              child: Container(
                                height: Dimensions.height100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(Dimensions.radius20),
                                      bottomRight: Radius.circular(Dimensions.radius20)
                                  ),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      BigText(text: recommendedProducts.recommendedProductList[index].name),
                                      SizedBox(height: Dimensions.height10,),
                                      const SmallText(text: 'With enticing ingredients'),
                                      SizedBox(height: Dimensions.height10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: const [
                                          IconAndText(

                                              icon: Icons.circle_sharp,
                                              text: 'Normal',
                                              iconColor: AppColors.iconColor1),


                                          IconAndText(

                                              icon: Icons.location_on,
                                              text: '1.7Km',
                                              iconColor: AppColors.mainColor),


                                          IconAndText(

                                              icon: Icons.access_time_rounded,
                                              text: '32min',
                                              iconColor: AppColors.iconColor2)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                    )
            ): const CircularProgressIndicator(
              color: AppColors.mainColor,
            );
          }

        )
      ],
    );
  }

  Widget _buildPageItem(int position, ProductModel popularProduct) {
    Matrix4 matrix4 = Matrix4.identity();
    if (position == currentValue.floor()) {
      var currScale = 1 - (currentValue - position) * (1-scaleFactor);

      var currTrans = height *(1-currScale)/2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else if(position == currentValue.floor()+1){
      var currScale = scaleFactor +(currentValue-position+1)*(1-scaleFactor);
      var currTrans = height *(1-currScale)/2;

      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }

    else if(position == currentValue.floor()-1){
      var currScale = 1-(currentValue-position)*(1-scaleFactor);
      var currTrans = height *(1-currScale)/2;

      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }

    else{
      var currScale = 0.8;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, height*(1-scaleFactor)/2, 1);

    }
    return Transform(
      transform: matrix4,
      child: Stack(
          children: [
            GestureDetector(
              onTap: (){
                Get.toNamed(PageRoutes.getPopularFood(position));
              },
              child: Container(
                height: Dimensions.firstContainer,
                margin: EdgeInsets.only(left: Dimensions.small, right: Dimensions.small),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.sized),
                    color: Colors.blue,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(AppConstants.BASE_URL + AppConstants.UPLOAD_URL +popularProduct.img!)
                    )
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimensions.pageView140,
                margin: EdgeInsets.only(left: 40, right: 40, bottom: Dimensions.small),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.sized),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 5.0,
                        color: Color(0xFFe8e8e8),
                        offset: Offset(0,5)
                      ),
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(-5,0)
                      ),
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(5,0)
                      )
                    ],

                ),
                child: Container(
                  padding: EdgeInsets.only(left: Dimensions.padding, top: Dimensions.small, right: Dimensions.padding,),
                  child: AppColumn(text: popularProduct.name!,)
                ),
              ),
            ),
          ]),
    );
  }
}