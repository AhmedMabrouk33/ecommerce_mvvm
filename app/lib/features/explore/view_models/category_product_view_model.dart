// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import '../configurations/controller_tags.dart';
import '../models/product_model.dart';

class CategoryProductViewModel extends GetxController {
  final List<ProductModel> productItems;

  final bool isBestSelling;

  final String screenTitle;

  CategoryProductViewModel({
    required this.productItems,
    required this.screenTitle,
    this.isBestSelling = false,
  });

  void rebuildProduct(int productIndex) {
    update(
      [
        productControllerTag + productItems[productIndex].id,
      ],
    );
  }
}
