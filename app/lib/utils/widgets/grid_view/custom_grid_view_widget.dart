import 'package:flutter/material.dart';

import './custom_grid_view_configuration.dart';

class CustomGridViewWidget {
  final CustomGridViewConfiguration customGridViewConfiguration;

  const CustomGridViewWidget({
    required this.customGridViewConfiguration,
  });

  Widget buildGridViewWidget(List<Widget> items) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: customGridViewConfiguration.crossItemCount,
        childAspectRatio: customGridViewConfiguration.crossRatio,
        mainAxisSpacing: customGridViewConfiguration.mainAxialSpacing,
        crossAxisSpacing: customGridViewConfiguration.crossAxialSpacing,
      ),
      scrollDirection: customGridViewConfiguration.scrollingAxis,
      itemCount: items.length,
      itemBuilder: (context, index) => items[index],
    );
  }
}
