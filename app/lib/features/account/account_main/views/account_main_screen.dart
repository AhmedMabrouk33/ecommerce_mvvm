import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../profile/ui/profile_account_card.dart';

import '../../../../core/routes/routes_name.dart';

import '../ui/account_title_tap_ui.dart';

import '../../../../core/ui/universal_ui.dart';

class AccountMainScreen extends StatelessWidget {
  const AccountMainScreen({super.key});

  final List<AccountTitleTapUi> _accountWidget = const [
    AccountTitleTapUi(
      leadIcon: Icons.person_2_outlined,
      title: 'Edit Profile',
      navigatorPageName: RoutesName.profile,
    ),
    AccountTitleTapUi(
      leadIcon: Icons.edit_location_alt_outlined,
      title: 'Shipping Address',
      navigatorPageName: RoutesName.myLocation,
    ),
    AccountTitleTapUi(
      leadIcon: Icons.history,
      title: 'Order History',
      navigatorPageName: RoutesName.profile,
    ),
  ];

  final AccountTitleTapUi _logOutTap = const AccountTitleTapUi(
    leadIcon: Icons.logout,
    title: 'Log Out',
    navigatorPageName: RoutesName.profile,
    showTrailingIcon: false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: applicationNavBar,
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 50),
              ProfileAccountCard.createUi(),
              const SizedBox(height: 50),
              Expanded(
                child: ListView(
                  children: [
                    for (final AccountTitleTapUi accountWidget
                        in _accountWidget)
                      accountWidget.createUi(_onTapMethod),
                  ],
                ),
              ),
              // const SizedBox(height: double.infinity * 0.0625),
              _logOutTap.createUi(_onTapMethod),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapMethod(String navigatorName) {
    switch (navigatorName) {
      case RoutesName.profile:
        Get.toNamed(navigatorName);
        break;
      case RoutesName.myLocation:
        Get.toNamed(navigatorName);
        break;
      default:
    }
  }
}
