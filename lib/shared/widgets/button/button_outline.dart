import 'package:flutter/material.dart';
import 'package:sobatkas/core/styles/colors.dart';

import '../image/asset_image.dart';

class MOutlinedButton extends StatelessWidget {
  const MOutlinedButton({
    super.key,
    required this.textButton,
    required this.onPressed,
    this.textStyle,
    this.icon,
    this.padding = 16,
  });

  final String textButton;
  final TextStyle? textStyle;
  final String? icon;
  final Function() onPressed;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: MyColors.primaryColor, width: .5),
        ),
        elevation: .3,
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) MyAssetImage(icon!, height: 22),
            Text(textButton, style: textStyle),
          ],
        ),
      ),
    );
  }
}
