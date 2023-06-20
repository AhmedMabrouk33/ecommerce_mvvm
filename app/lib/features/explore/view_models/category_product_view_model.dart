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
    required this.isBestSelling,
  });

  void showProductDetailsScreen(ProductModel selectedProduct) {
    // final int productIndex = productItems
    //     .indexWhere((productItem) => productItem.id == selectedProduct);

    Get.put<ProductDetailsViewModel>(
      ProductDetailsViewModel(
        // productDetails: selectedProduct,
        productIndex: selectedProduct.productGlobalIndex,
        isBestSelling: isBestSelling,
      ),
    );

    Get.toNamed(RoutesName.productDetailsExplore);
  }

  void updateProductUi(String productID) {
    update(
      [
        productControllerTag + productID,
      ],
    );
  }
}
