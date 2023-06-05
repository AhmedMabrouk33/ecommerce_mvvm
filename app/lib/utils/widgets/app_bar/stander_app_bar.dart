import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StanderAppBar extends StatelessWidget {
  const StanderAppBar({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFAECAB1),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          IconButton(
            onPressed: Get.back,
            icon: const Icon(
              Icons.keyboard_arrow_left_rounded,
              size: 35.74,
            ),
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              // TODO: This Style will call from theme data
              style: const TextStyle(
                fontSize: 26,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
