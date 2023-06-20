import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_model/cart_view_model.dart';

import '../configuration/cart_controller_tag.dart';

class ProductCartUi {
  static Widget buildProductCard(int index) {
    return Container(
      height: 165,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            offset: Offset(-1, 2),
            color: Colors.black,
            blurStyle: BlurStyle.normal,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 165,
            width: Get.width * 0.321,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              image: DecorationImage(
                image: NetworkImage(
                  Get.find<CartViewModel>().productImage(index),
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(width: 15.5),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 25),
                Text(
                  Get.find<CartViewModel>().productTitle(index),
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '\$ ${Get.find<CartViewModel>().productTotalPrice(index)}',
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xff00C569),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 27),
                Container(
                  height: 30,
                  width: 127,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color(0xffD9D9D9),
                  ),
                  padding: const EdgeInsets.all(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: () => Get.find<CartViewModel>()
                            .incrementProductAmount(index),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff00C569),
                          ),
                          child: const Icon(Icons.add),
                        ),
                      ),
                      Expanded(
                        child: GetBuilder<CartViewModel>(
                          id: CartControllerTag.productCartAmountTag +
                              Get.find<CartViewModel>().productID(index),
                          builder: (controller) {
                            return Text(
                              controller.productAmount(index).toString(),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            );
                          },
                        ),
                      ),
                      InkWell(
                        onTap: () => Get.find<CartViewModel>()
                            .decrementProductAmount(index),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border(
                              top: BorderSide(
                                width: 1,
                                color: Color(0xff00C569),
                                strokeAlign: BorderSide.strokeAlignOutside,
                              ),
                              bottom: BorderSide(
                                width: 1,
                                color: Color(0xff00C569),
                                strokeAlign: BorderSide.strokeAlignOutside,
                              ),
                              right: BorderSide(
                                width: 1,
                                color: Color(0xff00C569),
                                strokeAlign: BorderSide.strokeAlignOutside,
                              ),
                              left: BorderSide(
                                width: 1,
                                color: Color(0xff00C569),
                                strokeAlign: BorderSide.strokeAlignOutside,
                              ),
                            ),
                          ),
                          child: const Icon(Icons.remove),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 11),
        ],
      ),
    );
  }
}
