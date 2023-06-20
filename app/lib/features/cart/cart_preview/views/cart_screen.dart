import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_model/cart_view_model.dart';

import '../configuration/cart_controller_tag.dart';

import '../ui/product_cart_ui.dart';
import '../ui/product_price_card.dart';

import '../../../../core/ui/universal_ui.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: applicationNavBar,
      body: WillPopScope(
        onWillPop: () async {
          bottomNavBarController.popAction();

          return true;
        },
        child: SafeArea(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: GetBuilder<CartViewModel>(
                id: CartControllerTag.cartMainScreenTag,
                builder: (mainCartController) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (mainCartController.totalProductCartLength != 0)
                        ..._cartProducts()
                      else
                        _noProductWidgets(),
                      ProductPriceCard.buildWidget(
                        mainCartController.totalProductCartLength != 0
                            ? () {}
                            : null,
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }

  List<Widget> _cartProducts() {
    return [
      const SizedBox(height: 50),
      GetBuilder<CartViewModel>(
        id: CartControllerTag.productsListTag,
        builder: (controller) => controller.totalProductCartLength != 0
            ? Expanded(
                child: ListView.builder(
                  itemCount: controller.totalProductCartLength,
                  itemBuilder: (context, index) => Dismissible(
                    key: ValueKey(controller.productID(index)),
                    confirmDismiss: (direction) async {
                      if (direction == DismissDirection.startToEnd) {
                        return false;
                      }
                      return true;
                    },
                    background: Container(
                      color: Colors.yellow,
                      padding: const EdgeInsets.only(left: 30),
                      alignment: Alignment.centerLeft,
                      child: const Icon(
                        Icons.star_border_outlined,
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                    secondaryBackground: Container(
                      color: Colors.red,
                      padding: const EdgeInsets.only(right: 30),
                      alignment: Alignment.centerRight,
                      child: const Icon(
                        Icons.delete_forever,
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        controller.deleteAction(index);
                      }
                    },
                    child: ProductCartUi.buildProductCard(index),
                  ),
                ),
              )
            : Expanded(
                child: Container(
                  // height: double.negativeInfinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: _noProductWidgets(),
                ),
              ),
      ),
      const SizedBox(height: 20),
    ];
  }

  Widget _noProductWidgets() {
    return const Expanded(
      child: Center(
        child: Text(
          'There is No product  in cart',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
