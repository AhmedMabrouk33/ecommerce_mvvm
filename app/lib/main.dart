import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/routes/routes_name.dart';
import 'core/routes/routes_page.dart';

import './features/bottom_nav_bar_widget/view_models/general_bottom_nav_bar_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onInit: () => Get.put<GeneralBottomNavBarViewModel>(
        GeneralBottomNavBarViewModel(),
      ),
      title: 'e-commerce MVVM',
      getPages: RoutesPage.pages,
      initialRoute: RoutesName.exploreHome,
    );
  }
}
