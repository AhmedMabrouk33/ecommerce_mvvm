import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/routes/routes_name.dart';
import '../view_models/summary_view_model.dart';

import '../ui/delivery_card_ui.dart';

import '../../../../utils/widgets/app_bar/stander_app_bar.dart';

import '../configurations/controller_tags.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const StanderAppBar(
                title: 'Check Out',
              ),
              const SizedBox(height: 50),
              Expanded(
                child: GetBuilder<SummaryViewModel>(
                  dispose: (state) => Get.delete<SummaryViewModel>(),
                  id: SummaryControllerTag.checkOutTag,
                  builder: (controller) => ListView(
                    children: [
                      for (var deliveryData in controller.deliveryState)
                        DeliveryCardUi.buildUi(
                          deliveryModel: deliveryData,
                          selectedIndex: controller.selectedDeliveryState,
                          onSelectedMethod: () => controller
                              .selectDeliveryState(deliveryData.index),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(right: 20, bottom: 20),
                child: ElevatedButton(
                  onPressed: () => Get.toNamed(RoutesName.summaryCart),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(146, 50),
                    backgroundColor: const Color(0xff00C569),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  child: const Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
