import 'package:e_commerce/utilities/colors.dart';
import 'package:e_commerce/Pages/home/food_page_body.dart';
import 'package:e_commerce/utilities/dimensions.dart';
import 'package:e_commerce/widgets/big_text.dart';
import 'package:e_commerce/widgets/small_text.dart';
import 'package:flutter/material.dart';


class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

       body:Column(
         children: [

           Container(
             margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.bottom15),
             padding: EdgeInsets.only(left: Dimensions.left20, right: Dimensions.right20),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Column(
                   children: [
                     const BigText(text: "Nigeria", color: AppColors.mainColor),
                     Row(
                       children: const [
                         SmallText(text: "Lagos",color:  Colors.black),
                         Icon(Icons.arrow_drop_down_rounded)
                       ],
                     )
                   ],
                 ),

                 Center(
                   child: Container(
                     width: Dimensions.width45,
                     height: Dimensions.height45,
                     child: const Icon(Icons.search,color: Colors.white),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(15),
                       color: AppColors.mainColor,

                     ),
                   ),
                 )
               ],
             ),
           ),
           const Expanded(
               child: SingleChildScrollView(
                   child: FoodPageBody())),
         ]

       ),
    );
  }
}
