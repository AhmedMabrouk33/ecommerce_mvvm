import 'package:get/get.dart';

import '../models/product_model.dart';

import '../configurations/controller_tags.dart';

import '../configurations/update_product_controller.dart';

import '../configurations/explore_constants.dart';

import '../../../core/data/universal_data.dart';

class ProductDetailsViewModel extends GetxController {
  final bool isBestSelling;
  final int productIndex;

  late final ProductModel _selectedProduct;

  ProductDetailsViewModel({
    required this.productIndex,
    this.isBestSelling = false,
  });

  @override
  void onInit() {
    _selectedProduct = (!isBestSelling)
        ? products[productIndex]
        : bestSellingProducts[productIndex];

    super.onInit();
  }

  @override
  void onClose() {
    print('On close is called');
    print('The Product state is ' + _selectedProduct.productCartModel.state);
    if (_selectedProduct.productCartModel.state == productCartState) {
      !cartProducts.contains(_selectedProduct)
          ? cartProducts.add(_selectedProduct)
          : null;
    }
    print('Product Cart length is ' + cartProducts.length.toString());
    super.onClose();
  }

  void incrementProductAmount() {
    _selectedProduct.productCartModel.cart =
        _selectedProduct.productCartModel.cart + 1;

    _selectedProduct.productCartModel.totalPrice =
        _selectedProduct.productCartModel.totalPrice + _selectedProduct.price;

    if (_selectedProduct.productCartModel.cart > 0 &&
        _selectedProduct.productCartModel.state != productCartState) {
      _selectedProduct.productCartModel.state = productCartState;

      UpdateProductControllers.updateProductController(
        isBestSelling,
        _selectedProduct,
      );
    }

    update([amountSectionControllerTag]);
  }

  void decrementProductAmount() {
    _selectedProduct.productCartModel.cart =
        _selectedProduct.productCartModel.cart - 1;

    _selectedProduct.productCartModel.totalPrice =
        _selectedProduct.productCartModel.totalPrice - _selectedProduct.price;

    if (_selectedProduct.productCartModel.cart == 0 &&
        _selectedProduct.productCartModel.state == productCartState) {
      _selectedProduct.productCartModel.state = productNormalState;

      UpdateProductControllers.updateProductController(
        isBestSelling,
        _selectedProduct,
      );
    }

    update([amountSectionControllerTag]);
  }

  String get productImage => _selectedProduct.image;

  String get productTitle => _selectedProduct.title;

  String get productDetailsText => _selectedProduct.details;

  int get productCartAmount => _selectedProduct.productAmount;

  String get productPrice => _selectedProduct.price.toString();
}
