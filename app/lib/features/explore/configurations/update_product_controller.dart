import 'package:get/get.dart';

import '../view_models/explore_view_model.dart';
import '../view_models/category_product_view_model.dart';

import '../../../core/data/universal_data.dart';

import '../models/product_model.dart';

class UpdateProductControllers {
  static void updateProductController(
    bool isBestSelling,
    ProductModel productModel,
  ) {
    print('Update product controller');

    !isBestSelling
        ? _updateRegularProduct(productModel)
        : _updateBestSelling(productModel);
  }

  static void _updateBestSelling(ProductModel productModel) {
    print('Best Selling will update');

    bestSellingProducts[productModel.productGlobalIndex] = productModel;

    Get.isRegistered<CategoryProductViewModel>()
        ? Get.find<CategoryProductViewModel>().updateProductUi(productModel.id)
        : null;

    Get.find<ExploreViewModel>().rebuildProduct(productModel.id);
  }

  static void _updateRegularProduct(ProductModel productModel) {
    products[productModel.productGlobalIndex] = productModel;

    Get.find<CategoryProductViewModel>().updateProductUi(productModel.id);
    Get.find<ExploreViewModel>().rebuildProduct(productModel.id);
  }
}
