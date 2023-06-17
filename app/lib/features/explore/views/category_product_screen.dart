import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../configurations/controller_tags.dart';

import '../view_models/category_product_view_model.dart';

import '../ui/product_item_ui.dart';

import '../../../utils/widgets/app_bar/stander_app_bar.dart';
import '../../../utils/widgets/grid_view/custom_grid_view_configuration.dart';
import '../../../utils/widgets/grid_view/custom_grid_view_widget.dart';

class CategoryProductScreen extends StatelessWidget {
  const CategoryProductScreen({super.key});

  final CustomGridViewWidget _productGridViewWidget =
      const CustomGridViewWidget(
    customGridViewConfiguration: CustomGridViewConfiguration(
      crossItemCount: 2,
      crossAxialSpacing: 20,
      mainAxialSpacing: 20,
      crossRatio: 185 / 319,
      scrollingAxis: Axis.vertical,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: GetBuilder<CategoryProductViewModel>(
            dispose: (_) => Get.delete<CategoryProductViewModel>(),
            builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  StanderAppBar(title: controller.screenTitle),
                  Expanded(
                    child: Padding(
                      padding:
                          // const EdgeInsets.only(top: 50, right: 9, left: 10),
                          const EdgeInsets.only(top: 50, left: 10),
                      child: _productGridViewWidget.buildGridViewWidget(
                        [
                          for (var productItem in controller.productItems)
                            GetBuilder<CategoryProductViewModel>(
                              id: productControllerTag + productItem.id,
                              builder: (_) {
                                return ProductItemUi.createProductItem(
                                  productModel: productItem,
                                  onTapMethod:
                                      controller.showProductDetailsScreen,
                                );
                              },
                            ),
                        ],
                      ),
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
