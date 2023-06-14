import 'package:flutter/material.dart';

class CustomGridViewConfiguration {
  final int crossItemCount;
  final double crossAxialSpacing;
  final double mainAxialSpacing;
  final double crossRatio;
  final Axis scrollingAxis;

  const CustomGridViewConfiguration({
    required this.crossItemCount,
    required this.crossAxialSpacing,
    required this.mainAxialSpacing,
    required this.crossRatio,
    required this.scrollingAxis,
  });
}
