import 'package:get/get.dart';

import '../models/category_model.dart';
import '../models/product_model.dart';

import '../../../core/data/repository_configuration.dart';

import './product_details_view_model.dart';
import './category_product_view_model.dart';

import '../../../core/routes/routes_name.dart';

import '../configurations/controller_tags.dart';

import '../../../core/data/universal_data.dart';

class ExploreViewModel extends GetxController {
  List<CategoryModel> categoriesItem = [];

  bool showBottomNavBar = false;

  @override
  void onClose() {
    print('Explore view model is closed');
    super.onClose();
  }

  Future<void> prepareData() async {
    return await Future.wait(
      [
        ApplicationRepositories.categoryRepository.fetchAllCategory(),
        ApplicationRepositories.productRepository.fetchBestSellingProducts(),
        ApplicationRepositories.productRepository.fetchAllProduct(),
      ],
    ).then(
      (responseValue) {
        categoriesItem = [...responseValue.first as List<CategoryModel>];
        bestSellingProducts = [...responseValue[1] as List<ProductModel>];
        products = [...responseValue.last as List<ProductModel>];
        showBottomNavBar = true;
        update([exploreBottomNavBarTag]);
      },
    ).catchError(
      (errorResponse) {
        print('There is error');
        throw (errorResponse);
      },
    );
  }

  void rebuildScreen() {
    update([mainExploreControllerTag]);
  }

  List<ProductModel> get exploreBestSellingProduct {
    print('The best Selling product Length ${bestSellingProducts.length}');
    // TODO: The best Sellling in explore screen will be 4 products only from all best selling products.
    return [
      for (int index = 0; index < maxExploreBestSellingProductLength; index++)
        bestSellingProducts[index],
    ];
  }

  void navigateToCategoryProductsScreen(
    String categoryTitle, {
    bool isBetsSelling = false,
  }) {
    Get.put<CategoryProductViewModel>(
      CategoryProductViewModel(
        screenTitle: categoryTitle,
        productItems: !isBetsSelling
            ? products
                .where((productItem) => productItem.category == categoryTitle)
                .toList()
            : bestSellingProducts,
        isBestSelling: isBetsSelling,
      ),
    );

    Get.toNamed(RoutesName.categoryProductsExplore);
  }

  void navigateToProductDetailsScreen(ProductModel selectedProduct) {
    // print('Pressed product Id is $productId');

    Get.put<ProductDetailsViewModel>(
      ProductDetailsViewModel(
        productIndex: selectedProduct.productGlobalIndex,
        isBestSelling: true,
      ),
    );

    Get.toNamed(RoutesName.productDetailsExplore);
  }

  void rebuildProduct(String productID) {
    print('Product index is $productID');
    update(
      [
        bestSellingControllerTag + productID,
      ],
    );
  }
}
