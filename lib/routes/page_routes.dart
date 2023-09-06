import 'package:e_commerce/pages/food/popular_food_details.dart';
import 'package:e_commerce/pages/food/recommended_food_details.dart';
import 'package:get/get.dart';

import '../Pages/home/main_food_page.dart';

class PageRoutes{
    static const String initial = "/";
    static const String popularFood = "/popular-food";
    static const String recommendedFood = "/recommended-food";


    static getInitial ()=> '$initial';
    static getPopularFood (int pageId)=> '$popularFood?pageId=$pageId';
    static getRecommendedFood (int pageId)=> '$recommendedFood?pageId=$pageId';



    static List<GetPage> routes = [
      GetPage(name: initial,page: ()=>const MainFoodPage()),
      GetPage(name: popularFood, page: () {
        var pageId = Get.parameters['pageId'];
        return PopularFoodDetails(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn
      ),
      GetPage(name: recommendedFood, page: () {
        var pageId = Get.parameters['pageId'];
        return RecommendedFoodDetails(pageId: int.parse(pageId!));
      },
          transition: Transition.fadeIn
      )


   ];
}
