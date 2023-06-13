// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AccountTitleTapUi {
  final IconData leadIcon;
  final String title;
  final String navigatorPageName;
  final bool showTrailingIcon;

  const AccountTitleTapUi({
    required this.leadIcon,
    required this.title,
    required this.navigatorPageName,
    this.showTrailingIcon = true,
  });

  Widget createUi(void Function(String navigatorName) onTapAction) {
    return Container(
      height: 51,
      width: double.infinity,
      color: Colors.transparent,
      // padding: const EdgeInsets.only(left: 15, right: 15),
      margin: const EdgeInsets.only(bottom: 50, left: 15, right: 15),
      child: InkWell(
        onTap: () => onTapAction(navigatorPageName),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Card(
              // color: Color.fromARGB(5, 0, 197, 105),
              color: const Color.fromRGBO(0, 197, 105, 0.07),
              shadowColor: Colors.transparent,
              elevation: 0,
              surfaceTintColor: Colors.transparent,

              child: Icon(
                leadIcon,
                color: Colors.black,
                size: 51,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            showTrailingIcon
                ? const Icon(
                    Icons.chevron_right_outlined,
                    size: 25,
                    color: Colors.black,
                    weight: 10,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
