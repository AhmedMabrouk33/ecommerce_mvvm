import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_models/general_bottom_nav_bar_view_model.dart';

import '../ui/general_bottom_nav_bar_ui.dart';

import '../../../core/routes/routes_name.dart';

class GeneralBottomNavBarView extends StatelessWidget {
  const GeneralBottomNavBarView({super.key});

  final List<GeneralBottomNavBarUi> _bottomNavBarItems = const [
    GeneralBottomNavBarUi(
      title: 'Explore',
      iconPath: 'assets/icons/explore_icon.png',
      // FIXME: Navigation route must change to explore path.
      navigationRoute: RoutesName.profile,
    ),
    GeneralBottomNavBarUi(
      title: 'Cart',
      iconPath: 'assets/icons/cart_icon.png',
      // FIXME: Navigation route must change to cart path.
      navigationRoute: RoutesName.myLocation,
    ),
    GeneralBottomNavBarUi(
      title: 'Account',
      iconPath: 'assets/icons/account_icon.png',
      navigationRoute: RoutesName.account,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Color(0xffAECAB1),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(50),
        ),
      ),
      child: GetBuilder<GeneralBottomNavBarViewModel>(
          builder: (bottomNavBarController) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            for (final GeneralBottomNavBarUi bottomNavBarItem
                in _bottomNavBarItems)
              bottomNavBarItem.createBottomNavBarItem(
                isSelected: bottomNavBarController.isSelectedItem,
                onTapMethod: bottomNavBarController.pushNewRoute,
              )
          ],
        );
      }),
    );
  }
}
