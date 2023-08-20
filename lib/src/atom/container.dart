import 'package:finastra_design_system/finastra_design_system.dart';
import 'package:flutter/widgets.dart';

class FDSContainer extends StatelessWidget {
  const FDSContainer({
    this.border,
    this.borderRadius,
    this.boxShadow,
    this.color,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.alignment,
    this.constraints,
    this.borderType = FDSBorderType.outside,
    this.child,
    super.key,
  });

  final Border? border;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  final FDSColor? color;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;
  final BoxConstraints? constraints;
  final FDSBorderType borderType;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: borderType == FDSBorderType.inside
          ? BoxDecoration(
              border: border,
              borderRadius: borderRadius,
            )
          : null,
      decoration: BoxDecoration(
        color: color?.toColor(),
        border: borderType == FDSBorderType.outside ? border : null,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
      ),
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      alignment: alignment,
      constraints: constraints,
      child: child,
    );
  }
}

enum FDSBorderType {
  inside,
  outside,
}
