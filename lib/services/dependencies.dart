import 'package:e_commerce/Data/api/api_client.dart';
import 'package:e_commerce/Data/repository/popular_product_repo.dart';
import 'package:e_commerce/controllers/popular_product_controllers.dart';
import 'package:e_commerce/utilities/app_constants.dart';
import 'package:get/get.dart';

import '../Data/repository/recommended_product_repo.dart';
import '../controllers/recommended_product_controllers.dart';

Future<void> init()async{
  //api clients
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));


  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));

}