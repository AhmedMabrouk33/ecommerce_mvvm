import 'package:get/get.dart';

import '../view_models/explore_view_model.dart';
import '../view_models/category_product_view_model.dart';

import '../models/product_model.dart';

class UpdateProductControllers {
  static void updateBestSelling(int productIndex) {
    Get.isRegistered<CategoryProductViewModel>()
        ? Get.find<CategoryProductViewModel>().updateProductUi(productIndex)
        : null;
    Get.find<ExploreViewModel>().rebuildProduct(productIndex);
  }

  static void updateRegularProduct(int productIndex) {
    Get.find<CategoryProductViewModel>().updateProductUi(productIndex);
  }

  static void saveRegularProductChange(ProductModel updatedProduct) {
    
  }

  static void saveBestSellingProductChange(ProductModel updatedProduct) {}
}
