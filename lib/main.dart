import 'package:e_commerce/controllers/popular_product_controllers.dart';
import 'package:e_commerce/controllers/recommended_product_controllers.dart';
import 'package:e_commerce/routes/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Pages/home/main_food_page.dart';
import 'services/dependencies.dart' as dep;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainFoodPage(),
      initialRoute: PageRoutes.initial,
      getPages: PageRoutes.routes,
    );
  }
}

