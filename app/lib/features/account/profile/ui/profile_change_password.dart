import 'package:flutter/material.dart';



class ProfileChangePassword {
  const ProfileChangePassword();

  Widget buildWidget(
    void Function() onTap,
  ) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: const Icon(
        Icons.edit,
        color: Color.fromARGB(163, 113, 132, 132),
        size: 25,
      ),
      label: const Text('Change Password'),

      // TODO: this Style will replace to Get.theme
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(163, 61, 151, 108),
        foregroundColor: Colors.black,
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        fixedSize: const Size(239, 50),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
    );
  }
}
