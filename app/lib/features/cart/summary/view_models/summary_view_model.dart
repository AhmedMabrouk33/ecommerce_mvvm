import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/data/universal_data.dart';

import '../models/delivery_model.dart';

import '../configurations/controller_tags.dart';

import '../../../explore/models/product_model.dart';

import '../../../account/location/view_models/location_bottom_sheet_view_model.dart';
import '../../../account/location/ui/location_title_ui.dart';

import '../../../account/location/models/location_model.dart';

class SummaryViewModel extends GetxController {
  final List<DeliveryModel> deliveryState = const [
    DeliveryModel(
      index: 0,
      title: 'Stander Delivery',
      subTitle: 'Order will be delivered after 5 days',
    ),
    DeliveryModel(
      index: 1,
      title: 'Next Day Delivery',
      subTitle:
          'Place your order before 6pm and your items will be delivered the next day',
    ),
    DeliveryModel(
      index: 2,
      title: 'Nominated Delivery',
      subTitle:
          'Pick a particular date from the calendar and order will be delivered on selected date',
    ),
  ];

  // TODO: This Variable wi-ll change
  late DateTime _deliveryDate;

  int selectedDeliveryState = 0;

  late final double totalPrice;

  int _selectedShippingAddress = -1;

  String get deliveryDate =>
      '${_deliveryDate.day} - ${_deliveryDate.month} - ${_deliveryDate.year}';

  @override
  void onInit() {
    _deliveryDate = DateTime.now().add(const Duration(days: 5));

    super.onInit();

    _calculateTotalPrice();

    _findDeliveryShipping();
  }

  void _calculateTotalPrice() {
    var totalProductCartLength = cartProducts.length;

    double tempTotalPrice = 0;

    for (int index = 0; index < totalProductCartLength; index++) {
      tempTotalPrice = tempTotalPrice + cartProducts[index].productTotalPrice;
    }

    tempTotalPrice =
        (((tempTotalPrice * 100).roundToDouble()) / 100).toDouble();

    totalPrice = tempTotalPrice;

    print(totalPrice);
  }

  void _findDeliveryShipping() {
    final int userLocationLength = userLocations.length;

    print('User location length is $userLocationLength');

    if (userLocationLength != 0) {
      for (int index = 0; index < userLocationLength; index++) {
        if (!userLocations[index].isMainAddress) {
          continue;
        } else {
          _selectedShippingAddress = index;
          break;
        }
      }
    }
    print('User selected location index is $_selectedShippingAddress');
  }

  void selectDeliveryState(int selectedIndex) async {
    if (selectedDeliveryState != selectedIndex) {
      if (selectedIndex == 0) {
        _deliveryDate = DateTime.now().add(const Duration(days: 5));
      } else if (selectedIndex == 1) {
        _deliveryDate = DateTime.now().add(
          Duration(days: DateTime.now().hour < 18 ? 1 : 2),
        );
      } else {
        _deliveryDate = await showDatePicker(
          useRootNavigator: true,
          context: Get.context!,
          initialDate: _deliveryDate,
          firstDate: DateTime.now().add(const Duration(days: 1)),
          lastDate: DateTime(DateTime.now().year + 2),
          /*
      builder: (context, child) {
        return Theme(
          data: Get.theme.copyWith(
            // colorScheme: const ColorScheme.light(
            //   primary: Colors.amberAccent, // <-- SEE HERE
            //   onPrimary: Colors.redAccent, // <-- SEE HERE
            //   onSurface: Colors.blueAccent, // <-- SEE HERE
            // ),
            // textButtonTheme: TextButtonThemeData(
            //   style: TextButton.styleFrom(
            //     primary: Colors.red, // button text color
            //   ),
            // ),

            datePickerTheme: const DatePickerThemeData(
              headerBackgroundColor: Color(0xffAECAB1),
              headerForegroundColor: Colors.white,
              rangePickerBackgroundColor: Color(0xffAECAB1),
              rangePickerHeaderBackgroundColor: Color(0xffAECAB1),
              todayBorder: BorderSide(color: Colors.red),
              rangeSelectionBackgroundColor: Colors.amber,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                side: BorderSide(
                  color: Colors.black,
                  width: 5,
                  style: BorderStyle.solid,
                  strokeAlign: 3,
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
      */
        ).then(
          (selectedDate) {
            selectedDate != null ? null : selectedIndex = selectedDeliveryState;
            return selectedDate ?? _deliveryDate;
          },
        );
      }

      selectedDeliveryState = selectedIndex;

      update([SummaryControllerTag.checkOutTag]);
    }
  }

  bool get userSelectedShippingAddress {
    print(
      'User selected shipping address is ${_selectedShippingAddress != -1 ? true : false}',
    );
    return _selectedShippingAddress != -1 ? true : false;
  }

  String get selectedShippingAddressTitle =>
      userLocations[_selectedShippingAddress].title;

  String get selectedShippingAddressSubtitle {
    var shippingAddress = userLocations[_selectedShippingAddress];
    return shippingAddress.flatNo +
        ', ' +
        shippingAddress.buildingNo +
        ', ' +
        shippingAddress.streetAddress +
        ', ' +
        shippingAddress.city +
        ', ' +
        shippingAddress.area;
  }

  List<String> get productsImage => [
        for (var product in cartProducts) product.image,
      ];

  void updateShippingAddress() {
    print('Selected shipping address is $_selectedShippingAddress');
    if (_selectedShippingAddress != -1 &&
        (userLocations[_selectedShippingAddress].isMainAddress == false)) {
      print('object');

      _findDeliveryShipping();

      update([SummaryControllerTag.shippingAddressTag]);
    } else if (_selectedShippingAddress == -1) {
      print('Find delivery shipping will call');

      _findDeliveryShipping();

      print('Find delivery shipping End call');

      print('Selected shipping address index is $_selectedShippingAddress');

      update([
        SummaryControllerTag.shippingAddressTag,
        SummaryControllerTag.shippingDeliveryTag,
      ]);
    }
  }
}
