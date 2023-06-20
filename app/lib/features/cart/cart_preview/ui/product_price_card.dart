import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_model/cart_view_model.dart';

import '../configuration/cart_controller_tag.dart';

class ProductPriceCard {
  static Widget buildWidget(VoidCallback? checkOutAction) {
    return Container(
      height: 84,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        border: Border(),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -4),
            color: Color.fromRGBO(0, 0, 0, 0.25),
            // blurRadius: 4,
          ),
        ],
      ),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.black,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'TOTAL',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff929292),
                  ),
                ),
                GetBuilder<CartViewModel>(
                  id: CartControllerTag.totalPriceTag,
                  builder: (controller) => Text(
                    '\$ ${controller.totalPrice}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff00C569),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: checkOutAction,
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(146, 50),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                backgroundColor: const Color.fromRGBO(0, 197, 105, 1),
                foregroundColor: Colors.white,
              ),
              child: const Text('CHECKOUT'),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
