import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../account/location/view_models/location_view_model.dart';
import '../../../account/location/views/location_bottom_sheet_view.dart';
import '../view_models/summary_view_model.dart';

import '../configurations/controller_tags.dart';

import '../../../../utils/widgets/app_bar/stander_app_bar.dart';

import '../../../../utils/widgets/grid_view/custom_grid_view_configuration.dart';
import '../../../../utils/widgets/grid_view/custom_grid_view_widget.dart';

import '../../../account/location/ui/shipping_address_ui.dart';
import '../../../account/location/ui/select_shipping_address_bottomSheet.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  final CustomGridViewWidget _productGridView = const CustomGridViewWidget(
    customGridViewConfiguration: CustomGridViewConfiguration(
      crossItemCount: 1,
      crossAxialSpacing: 22,
      mainAxialSpacing: 20,
      crossRatio: 0.88,
      scrollingAxis: Axis.horizontal,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: SafeArea(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const StanderAppBar(
                  title: 'Summary',
                  showBackIcons: false,
                ),
                const SizedBox(height: 20),
                _productsWidget(),
                const SizedBox(height: 30),
                ..._totalPriceWidget(),
                const SizedBox(height: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: _shippingAddressDeliveryDate(),
                  ),
                ),
                const SizedBox(height: 20),
                GetBuilder<SummaryViewModel>(
                  id: SummaryControllerTag.shippingDeliveryTag,
                  builder: (controller) {
                    return _actionWidgets(
                      controller.userSelectedShippingAddress,
                    );
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _productsWidget() {
    return Container(
      height: 175,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Products',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xffAECAB1),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: _productGridView.buildGridViewWidget(
              [
                for (final String productImage
                    in Get.find<SummaryViewModel>().productsImage)
                  Container(
                    height: 142.857,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      image: DecorationImage(
                        image: NetworkImage(
                          productImage,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _totalPriceWidget() {
    return [
      Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 20),
        child: const Text(
          'TOTAL PRICE',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xffAECAB1),
          ),
        ),
      ),
      const SizedBox(height: 10),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        child: Text(
          '\$ ${Get.find<SummaryViewModel>().totalPrice}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xff00C569),
          ),
        ),
      ),
    ];
  }

  Widget _shippingAddressDeliveryDate() {
    return GetBuilder<SummaryViewModel>(
      id: SummaryControllerTag.shippingDeliveryTag,
      builder: (controller) {
        return controller.userSelectedShippingAddress
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GetBuilder<SummaryViewModel>(
                    id: SummaryControllerTag.shippingAddressTag,
                    builder: (controller) {
                      return ShippingAddressUi.shippingAddressUi(
                        title: controller.selectedShippingAddressTitle,
                        subTitle: controller.selectedShippingAddressSubtitle,
                        changeMethod: () => _selectNewShippingAddress(
                          isChangeNewShippingAddress: true,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Delivery Date : ',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 17),
                    child: Text(
                      controller.deliveryDate,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xff00C569),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              )
            : Center(
                child: ElevatedButton(
                  onPressed: () => _selectNewShippingAddress(
                    isChangeNewShippingAddress: false,
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(Get.width * 0.75, 50),
                    backgroundColor: const Color(0xff00C569),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text('Add Shipping address'),
                ),
              );
      },
    );
  }

  Widget _actionWidgets(bool userSelectedShippingAddress) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        ElevatedButton(
          onPressed: Get.back,
          style: const ButtonStyle(
            textStyle: MaterialStatePropertyAll<TextStyle>(
              TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            fixedSize: MaterialStatePropertyAll<Size>(Size(146, 50)),
            backgroundColor: MaterialStatePropertyAll<Color>(
              Color.fromRGBO(217, 217, 217, 1),
            ),
            foregroundColor: MaterialStatePropertyAll<Color>(Colors.black),
            shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                side: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(174, 202, 177, 1),
                ),
              ),
            ),
          ),
          child: const Text('BACK'),
        ),
        ElevatedButton(
          onPressed: userSelectedShippingAddress ? () {} : null,
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            fixedSize: const Size(146, 50),
            backgroundColor: const Color(0xff00C569),
            foregroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
          ),
          child: const Text('DELIVER'),
        ),
      ],
    );
  }

  void _selectNewShippingAddress({
    required bool isChangeNewShippingAddress,
  }) async {
    Get.put<LocationViewModel>(LocationViewModel());

    await Get.bottomSheet<void>(
      isScrollControlled: true,
      useRootNavigator: true,
      isDismissible: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
      ),
      isChangeNewShippingAddress
          ? SelectShippingAddressBottomSheet.buildBottomSheet()
          : LocationBottomSheetView.build(
              locationIndex: null,
            ),
    ).then(
      (_) {
        Get.find<SummaryViewModel>().updateShippingAddress();

        Get.delete<LocationViewModel>();
      },
    );
  }
}
