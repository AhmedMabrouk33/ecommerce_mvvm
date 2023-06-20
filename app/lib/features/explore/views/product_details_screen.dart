import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_models/product_details_view_model.dart';

import '../ui/product_amount_ui.dart';

import '../../../utils/widgets/app_bar/sticky_app_bar.dart';

import '../configurations/controller_tags.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: GetBuilder<ProductDetailsViewModel>(
            dispose: (_) => Get.delete<ProductDetailsViewModel>(),
            builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  StickyAppBar.buildAppBar(
                    imageNetworkUrl: controller.productImage,
                    popAction: Get.back,
                    favouriteAction: () {},
                    isFavourite: false,
                  ),
                  Expanded(
                    child: ListView(
                      padding:
                          const EdgeInsets.only(top: 8, left: 16, right: 10),
                      children: [
                        Text(
                          controller.productTitle,
                          style: const TextStyle(
                            fontSize: 26,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 50),
                        const Text(
                          'Details',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          controller.productDetailsText,
                          style: const TextStyle(
                            height: 1.5,
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    height: 84,
                    width: double.infinity,
                    // alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 32, right: 20),
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(36, 36, 36, 0.05),
                          offset: Offset(0, -1),
                          blurRadius: 10,
                          spreadRadius: 10,
                        ),
                      ],
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      // border: Border(
                      //   top: BorderSide(color: Color(0xffD9D9D9), width: 1),
                      // ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Price',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff929292),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '\$ ${controller.productPrice}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff00C569),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GetBuilder<ProductDetailsViewModel>(
                          id: amountSectionControllerTag,
                          builder: (controller) {
                            print('Ammount can be rebuild');
                            return ProductAmountUi.showAmountAction(
                              amount: controller.productCartAmount,
                              incrementAction:
                                  controller.incrementProductAmount,
                              decrementAction:
                                  controller.decrementProductAmount,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
