import 'package:flutter/material.dart';

class ShippingAddressUi {
  static Widget shippingAddressUi({
    required String title,
    required String subTitle,
    required VoidCallback changeMethod,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Shipping Address : ',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 15, right: 16),
          child: Text(
            subTitle,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: changeMethod,
          style: const ButtonStyle(
            foregroundColor: MaterialStatePropertyAll<Color>(Color(0xff00C569)),
            textStyle: MaterialStatePropertyAll<TextStyle>(
              TextStyle(
                color: Color(0xff00C569),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          child: const Text('Change'),
        ),
      ],
    );
  }
}
