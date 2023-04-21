import 'package:e_commerce/colors/colors.dart';
import 'package:e_commerce/home/food_page_body.dart';
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
             child: Container(
               margin: EdgeInsets.only(top: 45, bottom: 15),
               padding: EdgeInsets.only(left: 20, right: 20),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Column(
                     children: [
                       BigText(text: "Bangladesh", color: AppColors.mainColor),
                       Row(
                         children: [
                           SmallText(text: "Narshingdi",color:  Colors.black),
                           Icon(Icons.arrow_drop_down_rounded)
                         ],
                       )
                     ],
                   ),

                   Center(
                     child: Container(
                       width: 45,
                       height: 45,
                       child: Icon(Icons.search,color: Colors.white),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(15),
                         color: AppColors.mainColor,

                       ),
                     ),
                   )
                 ],
               ),
             ),
           ),
           FoodPageBody(),
         ]

       ),
    );
  }
}
