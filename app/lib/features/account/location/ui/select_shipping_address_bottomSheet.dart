import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_models/location_view_model.dart';

class SelectShippingAddressBottomSheet {
  static Widget buildBottomSheet() {
    print(Get.height);
    return Container(
      height: Get.height - 80,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(61, 151, 108, 0.64),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(50),
        ),
      ),
      child: GetBuilder<LocationViewModel>(
        init: Get.put<LocationViewModel>(LocationViewModel()),
        dispose: (state) => Get.delete<LocationViewModel>(),
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 30),
              const SizedBox(
                height: 5,
                width: 90,
                child: Divider(
                  thickness: 5,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 16),
                  child: Text(
                    'Select new Shipping address',
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.userLocationLength,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      controller.selectAction(index);

                      Get.back();
                    },
                    child: _locationCard(
                      title: controller.title(index),
                      subTitle: controller.addressDetails(index),
                      isSelected: controller.isSelected(index),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  static Widget _locationCard({
    required String title,
    required String subTitle,
    required bool isSelected,
  }) {
    return Container(
      height: 74,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
      padding: const EdgeInsets.only(left: 17, right: 17, top: 9, bottom: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -5),
            blurRadius: 4,
            color: Color.fromRGBO(0, 0, 0, 0.25),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  title,
                  style: !isSelected
                      ? const TextStyle(
                          fontSize: 20,
                          color: Color(0xffAECAB1),
                          fontWeight: FontWeight.w700,
                        )
                      : const TextStyle(
                          fontSize: 20,
                          color: Color(0xff00C569),
                          fontWeight: FontWeight.w700,
                        ),
                ),
                const SizedBox(height: 7),
                Expanded(
                  child: Text(
                    subTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          !isSelected
              ? Container(width: 0)
              : const Icon(
                  Icons.check_circle_outline_outlined,
                  color: Color(0xff00C569),
                  size: 30,
                ),
        ],
      ),
    );
  }
}
