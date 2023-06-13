import 'package:get/get.dart';

import '../../../core/routes/routes_name.dart';

class GeneralBottomNavBarViewModel extends GetxController {
  late String currentRoute;

  GeneralBottomNavBarViewModel();

  @override
  void onInit() {
    // FIXME: Initial route must be export route name.
    currentRoute = RoutesName.account;
    super.onInit();
  }

  bool isSelectedItem(String itemRoute) => currentRoute.contains(itemRoute);

  void pushNewRoute(String newRoute) {
    if (newRoute != currentRoute) {
      currentRoute = newRoute;
      // FIXME: Check if selected item is explore item pop all screen until explore page,
      Get.toNamed(newRoute);
      update();
    }
  }

  void popAction() {
    Get.back();
    currentRoute = Get.currentRoute;
    update();
  }
}
