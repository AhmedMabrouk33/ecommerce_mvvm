import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/routes/routes_name.dart';
import 'core/routes/routes_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'e-commerce MVVM',
      getPages: RoutesPage.pages,
      initialRoute: RoutesName.profile,
    );
  }
}
