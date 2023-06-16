import 'package:get/get.dart';

import '../models/product_model.dart';

import './explore_view_model.dart';

class ProductDetailsViewModel extends GetxController {
  final ProductModel productDetails;
  final bool isBestSelling;
  final int productIndex;

  ProductDetailsViewModel({
    required this.productDetails,
    required this.productIndex,
    this.isBestSelling = false,
  });

  final String amountSectionControllerID = 'amount-controller';

  int get productAmount => productDetails.productCartModel.cart;

  void incrementProductAmount() {
    if (productDetails.productCartModel.cart == 0) {
      productDetails.productCartModel.state = 'cart';

      // TODO: Check if Category product view model is saved in controller or not.
      Get.find<ExploreViewModel>().rebuildProduct(productIndex, isBestSelling);
    }
    productDetails.productCartModel.cart =
        productDetails.productCartModel.cart + 1;

    productDetails.productCartModel.totalPrice += productDetails.price;

    update([amountSectionControllerID]);

    print('Product Cart is ${productDetails.productCartModel.cart}');
    print('Product price is ${productDetails.price}');
  }

  void decrementProductAmount() {
    productDetails.productCartModel.cart =
        productDetails.productCartModel.cart - 1;

    productDetails.productCartModel.totalPrice =
        productDetails.productCartModel.totalPrice - productDetails.price;

    if (productDetails.productCartModel.cart == 0) {
      productDetails.productCartModel.state = '';
      // TODO: Check if Category product view model is saved in controller or not.
      Get.find<ExploreViewModel>().rebuildProduct(productIndex, isBestSelling);
    }

    update([amountSectionControllerID]);
  }
}
