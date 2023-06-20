import 'package:get/get.dart';

import './routes_name.dart';

import '../../features/account/profile/view_models/profile_view_model.dart';
import '../../features/explore/view_models/explore_view_model.dart';

import '../../features/explore/views/home_explore_screen.dart';

import '../../features/cart/cart_preview/view_model/cart_view_model.dart';

import '../../features/cart/cart_preview/views/cart_screen.dart';

import '../../features/account/account_main/views/account_main_screen.dart';
import '../../features/account/profile/views/profile_screen.dart';
import '../../features/account/location/views/location_screen.dart';
import '../../features/explore/views/product_details_screen.dart';
import '../../features/explore/views/category_product_screen.dart';

class RoutesPage {
  static List<GetPage<void>> pages = [
    // ********* * Explore Features. ************ /
    GetPage(
      name: RoutesName.exploreHome,
      page: () => const HomeExploreScreen(),
      binding: BindingsBuilder(
        () => Get.lazyPut(() => ExploreViewModel()),
      ),
    ),

    GetPage(
      name: RoutesName.categoryProductsExplore,
      page: () => const CategoryProductScreen(),
    ),

    GetPage(
      name: RoutesName.productDetailsExplore,
      page: () => const ProductDetailsScreen(),
    ),

    // ********* * Cart Features. ************ /
    GetPage(
      name: RoutesName.cartHome,
      page: () => const CartScreen(),
      binding: BindingsBuilder(
        () => Get.lazyPut(() => CartViewModel()),
      ),
    ),

    // ********* * Account Features. ************ /
    GetPage(
      name: RoutesName.account,
      page: () => const AccountMainScreen(),
      binding: BindingsBuilder(
        () => Get.lazyPut(() => ProfileViewModel()),
      ),
    ),
    GetPage(
      name: RoutesName.profile,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: RoutesName.myLocation,
      page: () => const LocationScreen(),
    ),
  ];
}
