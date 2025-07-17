import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sobatkas/core/extensions/context_extensions.dart';

class MTextField extends StatelessWidget {
  const MTextField({
    super.key,
    this.obscureText = false,
    this.enableSuggestions = false,
    this.autocorrect = false,
    this.isDense = false,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.controller,
    this.textInputAction,
    this.keyboardType,
    this.title,
    this.hintText,
    this.labelText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixText,
    this.onEditingComplete,
    this.onSubmitted,
    this.onChanged,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines = 1,
    this.minLines = 1,
    this.helperMaxLines = 4,
    this.maxLength,
    this.onTap,
    this.hintStyle,
    this.isFilled = false,
    this.fillColor,
    this.padding,
    this.prefixStyle,
    this.focusNode,
    this.decoration,
    this.floatingLabelBehavior,
    this.inputFormatters,
    this.margin = EdgeInsets.zero,
    this.showLabel = false,
    this.labelStyle,
    this.validator,
    this.initialValue,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.showCounter = true,
    this.style,
    this.suffixIconWidth,
    this.suffixIconHeight,
    this.disableSuffixIconConstraints = false,
    this.overrideAllBorderColor,
    this.subtitle,
    this.titleStyle,
  });

  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final bool isDense;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextCapitalization textCapitalization;
  final String? title;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? errorText;
  final String? prefixText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? helperMaxLines;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final dynamic Function()? onTap;
  final TextStyle? hintStyle;
  final bool isFilled;
  final Color? fillColor;
  final TextStyle? prefixStyle;
  final EdgeInsetsGeometry? padding;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry margin;
  final bool showLabel;
  final TextStyle? labelStyle;
  final String? Function(String?)? validator;
  final String? initialValue;
  final AutovalidateMode autovalidateMode;
  final bool showCounter;
  final double? suffixIconWidth;
  final double? suffixIconHeight;
  final TextStyle? style;
  final bool disableSuffixIconConstraints;
  final Color? overrideAllBorderColor;
  final String? subtitle;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) Text(title!, style: titleStyle),
          if (subtitle != null) ...[
            const SizedBox(height: 2),
            Text(
              subtitle!,
              style: context.getBodySmallTextStyle(context.outlineColor),
            ),
          ],
          if (title != null) const SizedBox(height: 10),
          TextFormField(
            autovalidateMode: autovalidateMode,
            initialValue: controller == null ? initialValue : null,
            onTap: onTap,
            onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
            obscureText: obscureText,
            enableSuggestions: enableSuggestions,
            autocorrect: autocorrect,
            enabled: enabled,
            readOnly: readOnly || onTap != null,
            autofocus: autofocus,
            controller: controller,
            textInputAction: textInputAction,
            keyboardType: keyboardType,
            validator: validator,
            cursorColor: context.primaryColor,
            cursorWidth: 1,
            onEditingComplete: onEditingComplete,
            onFieldSubmitted: onSubmitted,
            onChanged: onChanged,
            textCapitalization: textCapitalization,
            minLines: minLines,
            maxLines: maxLines,
            focusNode: focusNode,
            maxLength: maxLength,
            style: context.getBodyMediumTextStyle(context.onSurfaceColor),
            decoration: decoration ?? buildInputDecoration(context),
            inputFormatters: inputFormatters,
          ),
        ],
      ),
    );
  }

  InputDecoration buildInputDecoration(BuildContext context) {
    return InputDecoration(
      suffixIconConstraints: disableSuffixIconConstraints
          ? null
          : BoxConstraints(
              maxHeight: suffixIconHeight ?? 24,
              maxWidth: suffixIconWidth ?? 24,
            ),
      isDense: isDense,
      hintText: hintText,
      labelText: showLabel ? labelText : null,
      helperText: helperText,
      errorText: errorText,
      prefixText: prefixText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      counterText: showCounter == true ? null : '',
      contentPadding: padding,
      helperMaxLines: helperMaxLines,
      suffixIconColor: context.onSurfaceVariantColor,
      prefixIconColor: context.onSurfaceVariantColor,
      fillColor: readOnly ? Colors.grey.shade200 : fillColor,
      filled: readOnly || isFilled,
      floatingLabelBehavior: floatingLabelBehavior,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: overrideAllBorderColor ?? context.outlineColor,
          width: 0.5,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: fillColor ?? context.outlineColor,
          width: 0.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: overrideAllBorderColor ?? context.primaryColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: context.errorColor, width: 2),
      ),
      errorMaxLines: 2,
      errorStyle: context.getBodySmallTextStyle(context.errorColor),
      helperStyle: context.getBodySmallTextStyle(context.onSurfaceVariantColor),
      labelStyle: labelStyle ?? context.getBodyMediumTextStyle(Colors.grey),
      hintStyle: hintStyle ?? context.getBodyMediumTextStyle(Colors.grey),
      prefixStyle: prefixStyle ?? context.getBodyMediumTextStyle(Colors.grey),
    );
  }
}
