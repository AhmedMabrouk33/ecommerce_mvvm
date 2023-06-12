import 'package:flutter/material.dart';

class CustomTextFormField {
  static Widget creteTextField({
    required String? initialValue,
    required String label,
    required String? Function(String? inputText) validatorMethod,
    required void Function(String? inputText) onSaveMethod,
    required TextInputType keyboardType,
  }) {
    return TextFormField(
      initialValue: initialValue,
      validator: validatorMethod,
      onSaved: onSaveMethod,
      keyboardType: keyboardType,
      decoration: InputDecoration(labelText: label),
    );
  }
}
