import 'package:flutter/material.dart';

// example use : context.topPadding

extension ContextExtension on BuildContext {
  double get topPadding => MediaQuery.of(this).padding.top;
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
}
