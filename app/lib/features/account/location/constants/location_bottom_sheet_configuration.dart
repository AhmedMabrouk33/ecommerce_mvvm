// FIXME: Move this file in core/ui/configuration
import 'package:flutter/material.dart';

class LocationBottomSheetConfiguration {
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

  static const Icon addIcon = Icon(
    Icons.add,
    color: Colors.black,
    size: 38,
  );

  static const Icon editIcon = Icon(
    Icons.edit,
    color: Color.fromARGB(214, 3, 13, 255),
    size: 20,
  );

  static const Icon deleteIcon = Icon(
    Icons.delete_forever_outlined,
    color: Color(0xff520505),
    size: 20,
  );

  static const Icon selectedIcon = Icon(
    Icons.check_circle_outline_outlined,
    color: Color(0xff3D976C),
    size: 35,
  );

  static const Icon unselectedIcon = Icon(
    Icons.circle_outlined,
    color: Color(0xff5C5C5C),
    size: 35,
  );

  static const Icon uploadIcon = Icon(
    Icons.upload,
    color: Color.fromARGB(214, 113, 132, 132),
    size: 25,
  );

  static const Icon popMenuIcon = Icon(
    Icons.more_vert_outlined,
    color: Color(0xff3D976C),
    size: 35,
  );

  static const Icon infoErrorIcon = Icon(
    Icons.info,
    color: Color(0xffC80C0C),
    size: 50,
  );

  static const Icon infoErrorBottomSheetIcon = Icon(
    Icons.info,
    color: Colors.white,
    size: 60,
  );

  static const CircularProgressIndicator updatingCircleIndicator =
      CircularProgressIndicator(
    color: Color.fromARGB(163, 61, 151, 108),
    strokeWidth: 25,
  );
}
