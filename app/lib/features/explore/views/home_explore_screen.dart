import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_models/explore_view_model.dart';

import '../ui/category_item_ui.dart';
import '../ui/product_item_ui.dart';

import '../../../utils/widgets/grid_view/custom_grid_view_configuration.dart';
import '../../../utils/widgets/grid_view/custom_grid_view_widget.dart';

import '../../../core/ui/universal_ui.dart';

class HomeExploreScreen extends StatelessWidget {
  const HomeExploreScreen({super.key});

  final CustomGridViewWidget _categoryGridViewWidget =
      const CustomGridViewWidget(
    customGridViewConfiguration: CustomGridViewConfiguration(
      crossItemCount: 1,
      crossAxialSpacing: 15,
      mainAxialSpacing: 15,
      crossRatio: 1.25,
      scrollingAxis: Axis.horizontal,
    ),
  );

  final CustomGridViewWidget _bestSellingGridViewWidget =
      const CustomGridViewWidget(
    customGridViewConfiguration: CustomGridViewConfiguration(
      crossItemCount: 1,
      crossAxialSpacing: 15,
      mainAxialSpacing: 15,
      crossRatio: 800 / 360,
      scrollingAxis: Axis.horizontal,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GetBuilder<ExploreViewModel>(
        id: 'explore_bottom_nav_bar',
        builder: (controller) => controller.showBottomNavBar
            ? applicationNavBar
            : Container(
                height: 0,
                width: 15,
                color: Colors.transparent,
              ),
      ),
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () async => false,
        child: SafeArea(
          child: GetBuilder<ExploreViewModel>(
            id: 'Main-Explore-Controller',
            dispose: (_) => Get.delete<ExploreViewModel>(),
            builder: (controller) => FutureBuilder(
              future: controller.prepareData(),
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? _waitingWidgets()
                    : snapshot.error == null
                        ? _mainScreenWidgets()
                        : _errorWidget(snapshot.error.toString());
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _mainScreenWidgets() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 16),
      child: SingleChildScrollView(
        child: GetBuilder<ExploreViewModel>(
          builder: (controller) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const SizedBox(height: 47),
                const Text(
                  'Categories :',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 19),
                SizedBox(
                  height: 90,
                  width: double.infinity,
                  child: _categoryGridViewWidget.buildGridViewWidget(
                    [
                      for (var categoryModel in controller.categoriesItem)
                        CategoryItemUi.createCategoryItem(
                          categoryModel: categoryModel,
                          onTapMethod: controller.pushCategoryPage,
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 52),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      'Best Selling :',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        foregroundColor: Colors.black,
                      ),
                      child: const Text('See More'),
                    ),
                    // const SizedBox(width: 15),
                  ],
                ),
                const SizedBox(height: 31),
                SizedBox(
                  height: 330,
                  width: double.infinity,
                  child: _bestSellingGridViewWidget.buildGridViewWidget(
                    [
                      for (var productItem
                          in controller.getExploreBestSellingProduct())
                        GetBuilder<ExploreViewModel>(
                          id: controller.bestSellingControllerTag +
                              productItem.id,
                          builder: (_) => ProductItemUi.createProductItem(
                            productModel: productItem,
                            onTapMethod:
                                controller.pushExploreBestSellingProductDetails,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _waitingWidgets() {
    return const SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          CircularProgressIndicator(
            color: Color.fromRGBO(0, 197, 105, 1),
            strokeWidth: 5,
          ),
          Text(
            'Fetching Data......\nPlease Wait',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _errorWidget(String errorMessage) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.red,
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          ElevatedButton(
            onPressed: Get.find<ExploreViewModel>().rebuildScreen,
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(239, 50),
              backgroundColor: const Color(0xffD9D9D9),
              foregroundColor: Colors.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.all(Radius.circular(15)),
                side: BorderSide(
                  width: 2,
                  color: Color.fromARGB(163, 61, 151, 108),
                ),
              ),
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            child: const Text('Try again'),
          ),
        ],
      ),
    );
  }
}
