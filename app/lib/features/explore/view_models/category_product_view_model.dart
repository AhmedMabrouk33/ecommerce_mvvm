import 'package:get/get.dart';

import '../configurations/controller_tags.dart';
import '../models/product_model.dart';

import './product_details_view_model.dart';

import '../../../core/routes/routes_name.dart';

class CategoryProductViewModel extends GetxController {
  final List<ProductModel> productItems;

  final bool isBestSelling;

  final String screenTitle;

  CategoryProductViewModel({
    required this.productItems,
    required this.screenTitle,
    this.isBestSelling = false,
  });

  void showProductDetailsScreen(String productId) {
    final int productIndex =
        productItems.indexWhere((productItem) => productItem.id == productId);

    Get.put<ProductDetailsViewModel>(
      ProductDetailsViewModel(
        productDetails: productItems[productIndex],
        productIndex: productIndex,
        isBestSelling: isBestSelling,
      ),
    );

    Get.toNamed(RoutesName.productDetailsExplore);
  }

  void updateProductUi(int productIndex) {
    update(
      [
        productControllerTag + productItems[productIndex].id,
      ],
    );
  }
}
