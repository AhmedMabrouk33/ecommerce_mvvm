import 'package:flutter/material.dart';

class ProfileBottomSheetConfiguration {
  static const BoxDecoration normalBottomSheetDecoration = BoxDecoration(
    color: Color(0xffAECAB1),
    borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
  );

  static const BoxDecoration errorBottomSheetDecoration = BoxDecoration(
    color: Colors.red,
    borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
  );

  static ButtonStyle mainActionElevatedButtonStyle = ElevatedButton.styleFrom(
    fixedSize: const Size(239, 50),
    backgroundColor: const Color.fromARGB(163, 61, 151, 108),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.all(Radius.circular(15)),
    ),
    foregroundColor: Colors.black,
    textStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );

  static ButtonStyle sideActionElevatedButtonStyle = ElevatedButton.styleFrom(
    fixedSize: const Size(239, 50),
    backgroundColor: const Color(0xffD9D9D9),
    foregroundColor: Colors.black,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.all(Radius.circular(15)),
      side: BorderSide(
        width: 2,
        color: Color.fromARGB(163, 61, 151, 108),
      ),
    ),
    textStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );

  static const Icon uploadIcon = Icon(
    Icons.upload,
    color: Color.fromARGB(214, 113, 132, 132),
    size: 25,
  );

  static const CircularProgressIndicator updatingCircleIndicator =
      CircularProgressIndicator(
    color: Color.fromARGB(163, 61, 151, 108),
    strokeWidth: 25,
  );
}
