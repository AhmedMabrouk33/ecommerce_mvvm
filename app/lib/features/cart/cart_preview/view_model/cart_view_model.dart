import 'package:get/get.dart';

import '../../../explore/configurations/explore_constants.dart';

import '../../../../core/data/universal_data.dart';
import '../../../explore/view_models/explore_view_model.dart';
import '../configuration/cart_controller_tag.dart';

class CartViewModel extends GetxController {
  late int totalProductCartLength;
  late double totalPrice;

  @override
  void onInit() {
    totalPrice = 0;
    if (cartProducts.isNotEmpty) {
      totalProductCartLength = cartProducts.length;

      for (int index = 0; index < totalProductCartLength; index++) {
        totalPrice = totalPrice + cartProducts[index].productTotalPrice;
      }

      update([CartControllerTag.totalPriceTag]);
    } else {
      totalProductCartLength = 0;
    }

    super.onInit();
  }

  void _cartAction(int index, {required bool isDeleteAction}) {
    int productIndex = 0;

    if (products[cartProducts[index].productGlobalIndex] ==
        cartProducts[index]) {
      productIndex = cartProducts[index].productGlobalIndex;

      products[productIndex].productCartModel.cart = 0;

      products[productIndex].productCartModel.totalPrice = 0;

      products[productIndex].productCartModel.state = productNormalState;
    } else {
      productIndex = cartProducts[index].productGlobalIndex;

      bestSellingProducts[productIndex].productCartModel.cart = 0;

      bestSellingProducts[productIndex].productCartModel.totalPrice = 0;

      bestSellingProducts[productIndex].productCartModel.state =
          productNormalState;
    }
  }

  void deleteAction(int index) {
    totalPrice = totalPrice - productTotalPrice(index);

    cartProducts[index].productCartModel.cart = 0;
    cartProducts[index].productCartModel.totalPrice = 0;
    cartProducts[index].productCartModel.state = '';

    totalProductCartLength -= 1;

    cartProducts.removeAt(index);

    if (totalProductCartLength > 0) {
      update(
        [
          CartControllerTag.productsListTag,
          CartControllerTag.totalPriceTag,
        ],
      );
    } else {
      totalPrice = 0;
      update(
        [CartControllerTag.cartMainScreenTag],
      );
    }

    Get.find<ExploreViewModel>().update();
  }

  void favouriteAction(int index) {}

  void incrementProductAmount(int index) {
    cartProducts[index].productCartModel.cart = productAmount(index) + 1;
    cartProducts[index].productCartModel.totalPrice =
        productTotalPrice(index) + cartProducts[index].price;
    totalPrice = totalPrice + cartProducts[index].price;

    update([
      CartControllerTag.totalPriceTag,
      CartControllerTag.productCartAmountTag + cartProducts[index].id,
    ]);
  }

  void decrementProductAmount(int index) {
    if (productAmount(index) > 1) {
      cartProducts[index].productCartModel.cart = productAmount(index) - 1;
      cartProducts[index].productCartModel.totalPrice =
          productTotalPrice(index) - cartProducts[index].price;
      totalPrice = totalPrice - cartProducts[index].price;

      update([
        CartControllerTag.totalPriceTag,
        CartControllerTag.productCartAmountTag + cartProducts[index].id,
      ]);
    } else {
      deleteAction(index);
    }
  }

  String productID(int index) => cartProducts[index].id;

  String productImage(int index) => cartProducts[index].image;

  String productTitle(int index) => cartProducts[index].title;

  double productTotalPrice(int index) => cartProducts[index].productTotalPrice;

  int productAmount(int index) => cartProducts[index].productAmount;

  String productAmountController(int index) =>
      CartControllerTag.productCartAmountTag + cartProducts[index].id;
}
