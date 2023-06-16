import 'package:get/get.dart';

import '../models/category_model.dart';
import '../models/product_model.dart';

import '../../../core/data/repository_configuration.dart';

import './product_details_view_model.dart';

import '../../../core/routes/routes_name.dart';

class ExploreViewModel extends GetxController {
  List<CategoryModel> categoriesItem = [];
  List<ProductModel> _productItems = [];
  List<ProductModel> _bestSellingItems = [];

  bool showBottomNavBar = false;

  String bestSellingControllerTag = 'Best-Selling-';
  String productControllerTag = 'Product-';

  Future<void> prepareData() async {
    return await Future.wait(
      [
        ApplicationRepositories.categoryRepository.fetchAllCategory(),
        ApplicationRepositories.productRepository.fetchBestSellingProducts(),
        // ApplicationRepositories.productRepository.fetchAllProduct(),
      ],
    ).then(
      (responseValue) {
        categoriesItem = [...responseValue.first as List<CategoryModel>];
        _bestSellingItems = [...responseValue[1] as List<ProductModel>];
        // _productItems = [...responseValue.last as List<ProductModel>];
        showBottomNavBar = true;
        update(['explore_bottom_nav_bar']);
      },
    ).catchError(
      (errorResponse) {
        print('There is error');
        throw (errorResponse);
      },
    );
  }

  void rebuildScreen() {
    update(['Main-Explore-Controller']);
  }

  void pushCategoryPage(String categoryTitle) {}

  int _findProductIndex(String productId, {bool isBestSellingProduct = false}) {
    return !isBestSellingProduct
        ? _bestSellingItems
            .indexWhere((productItem) => productItem.id == productId)
        : _bestSellingItems
            .indexWhere((productItem) => productItem.id == productId);
  }

  List<ProductModel> getExploreBestSellingProduct() {
    print('The best Selling product Length ${_bestSellingItems.length}');
    // TODO: The best Sellling in explore screen will be 4 products only from all best selling products.
    return [
      ..._bestSellingItems,
      ..._bestSellingItems,
      ..._bestSellingItems,
      ..._bestSellingItems,
      ..._bestSellingItems,
    ];
  }

  void pushExploreBestSellingProductDetails(String productId) {
    print('Pressed product Id is $productId');
    var selectedProduct = _bestSellingItems
        .firstWhere((productItem) => productItem.id == productId);

    Get.put<ProductDetailsViewModel>(
      ProductDetailsViewModel(
        productDetails: selectedProduct,
        productIndex: _findProductIndex(productId),
        isBestSelling: true,
      ),
    );

    Get.toNamed(RoutesName.productDetailsExplore);
  }

  void rebuildProduct(int productIndex, bool isBestSelling) {
    update(
      [
        !isBestSelling
            ? (bestSellingControllerTag + _bestSellingItems[productIndex].id)
            : productControllerTag + _productItems[productIndex].id
      ],
    );
  }
}
