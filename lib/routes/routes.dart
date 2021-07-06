import 'package:clothesstore/home/home.dart';
import 'package:get/get.dart';

class Routes {
  static List<GetPage> routes = [
    GetPage(
      name: HomeScreen.routeName,
      page: () => HomeScreen(),
    ),
  ];
}
