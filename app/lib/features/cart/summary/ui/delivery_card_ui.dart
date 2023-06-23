import 'package:flutter/material.dart';

import '../models/delivery_model.dart';

class DeliveryCardUi {
  static Widget buildUi({
    required DeliveryModel deliveryModel,
    required int selectedIndex,
    required VoidCallback onSelectedMethod,
  }) {
    return Container(
      height: 120,
      // width: Get.size.width - 30,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 50),
      child: InkWell(
        onTap: onSelectedMethod,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(width: 15),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      deliveryModel.title,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Text(
                        deliveryModel.subTitle,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 4,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 27),
            Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                color: Color(0xffD9D9D9),
                shape: BoxShape.circle,
              ),
              child: selectedIndex != deliveryModel.index
                  ? null
                  : const Icon(
                      Icons.circle,
                      size: 20,
                      color: Color(0xff00C569),
                    ),
            ),
            const SizedBox(width: 20),
            const SizedBox(width: 15),
          ],
        ),
      ),
    );
  }
}
