import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home/home.dart';
import 'routes/routes.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ClothesstoreApp',
      getPages: Routes.routes,
      initialRoute: HomeScreen.routeName,
    );
  }
}
