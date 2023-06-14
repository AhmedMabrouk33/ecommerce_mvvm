import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralBottomNavBarUi {
  final String title;
  final String iconPath;
  final String navigationRoute;

  const GeneralBottomNavBarUi({
    required this.title,
    required this.iconPath,
    required this.navigationRoute,
  });

  Widget createBottomNavBarItem({
    required bool Function(String itemRoute) isSelected,
    required void Function(String itemRoute) onTapMethod,
  }) {
    return SizedBox(
      height: 60,
      width: Get.width / 3,
      child: InkWell(
        onTap: () => onTapMethod(navigationRoute),
        child: !isSelected(navigationRoute)
            ? Center(
                child: Image.asset(iconPath),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
