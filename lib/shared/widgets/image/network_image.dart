import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MNetworkImage extends StatelessWidget {
  const MNetworkImage(
    this.url, {
    super.key,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.placeholderWidget,
    this.errorWidget,
    this.color,
    this.defaultErrorIconSize = 24,
    this.alignment,
    this.emptyErrorWidget = false,
    this.emptyPlaceholderWidget = false,
    this.emptyProgressWidget = false,
    this.radius = 0,
    this.borderRadius,
  });

  final String? url;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Widget? placeholderWidget;
  final Widget? errorWidget;
  final Color? color;
  final double? defaultErrorIconSize;
  final Alignment? alignment;
  final bool emptyErrorWidget;
  final bool emptyPlaceholderWidget;
  final bool emptyProgressWidget;
  final double radius;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    if (url?.endsWith('svg') ?? false) {
      return SizedBox(
        width: width,
        height: height,
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(radius),
          child: SvgPicture.network(
            '$url',
            height: height,
            width: width,
            colorFilter: color == null
                ? null
                : ColorFilter.mode(color!, BlendMode.srcIn),
            fit: fit,
          ),
        ),
      );
    }

    if (url?.isEmpty ?? false) {
      if (errorWidget != null) return errorWidget!;
      return Icon(
        Icons.image_not_supported_outlined,
        size: defaultErrorIconSize,
        color: color,
      );
    }

    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(radius),
      child: SizedBox(
        width: width,
        height: height,
        child: CachedNetworkImage(
          imageUrl: '$url',
          fit: fit,
          color: color,
          alignment: alignment ?? Alignment.center,
          placeholder: (c, i) =>
              const Center(child: CupertinoActivityIndicator()),
          errorWidget: (c, u, e) =>
              errorWidget ??
              Icon(Icons.broken_image, color: color ?? Colors.grey),
        ),
      ),
    );
  }
}
