import 'package:get/get.dart';

import '../models/category_model.dart';
import '../models/product_model.dart';

import '../../../core/data/repository_configuration.dart';

class ExploreViewModel extends GetxController {
  List<CategoryModel> categoriesItem = [];
  List<ProductModel> _productItems = [];
  List<ProductModel> _bestSellingItems = [];

  bool showBottomNavBar = false;

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

  void pushProductDetails(String productId) {
    print('Pressed product Id is $productId');
  }
}
