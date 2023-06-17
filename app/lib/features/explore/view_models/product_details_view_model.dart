import 'package:get/get.dart';

import '../models/product_model.dart';

import '../configurations/controller_tags.dart';

import '../configurations/update_product_controller.dart';

class ProductDetailsViewModel extends GetxController {
  final ProductModel productDetails;
  final bool isBestSelling;
  final int productIndex;

  ProductDetailsViewModel({
    required this.productDetails,
    required this.productIndex,
    this.isBestSelling = false,
  });

  @override
  void onClose() {
    print('The View model is closed');
    // Get.delete<ProductDetailsViewModel>();
    super.onClose();
  }

  int get productAmount => productDetails.productCartModel.cart;

  void incrementProductAmount() {
    if (productDetails.productCartModel.cart == 0) {
      productDetails.productCartModel.state = 'cart';

      !isBestSelling
          ? UpdateProductControllers.updateRegularProduct(productIndex)
          : UpdateProductControllers.updateBestSelling(productIndex);
    }
    productDetails.productCartModel.cart =
        productDetails.productCartModel.cart + 1;

    productDetails.productCartModel.totalPrice =
        productDetails.productCartModel.totalPrice + productDetails.price;

    update([amountSectionControllerTag]);

    print('Product Cart is ${productDetails.productCartModel.cart}');
    print('Product price is ${productDetails.productCartModel.totalPrice}');
  }

  void decrementProductAmount() {
    productDetails.productCartModel.cart =
        productDetails.productCartModel.cart - 1;

    productDetails.productCartModel.totalPrice =
        productDetails.productCartModel.totalPrice - productDetails.price;

    if (productDetails.productCartModel.cart == 0) {
      productDetails.productCartModel.state = '';

      !isBestSelling
          ? UpdateProductControllers.updateRegularProduct(productIndex)
          : UpdateProductControllers.updateBestSelling(productIndex);
    }

    update([amountSectionControllerTag]);
  }
}
