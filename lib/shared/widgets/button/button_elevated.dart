import 'package:flutter/material.dart';
import 'package:sobatkas/core/styles/colors.dart';

import '../asset_image.dart';

class MFilledElevatedButton extends StatelessWidget {
  const MFilledElevatedButton({
    super.key,
    this.textButton,
    this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.padding = 16,
  });

  final String? textButton;
  final String? icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback onPressed;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? MyColors.primaryColor,
        foregroundColor: foregroundColor ?? Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) MyAssetImage(icon!, height: 22),
            if (textButton != null) Text(textButton!),
          ],
        ),
      ),
    );
  }
}
