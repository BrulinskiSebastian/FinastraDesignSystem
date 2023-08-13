import 'package:finastra_design_system/gen/assets.gen.dart';
import 'package:finastra_design_system/src/component/text.dart';
import 'package:finastra_design_system/src/theme.dart';
import 'package:flutter/widgets.dart';

import '../atom/gradient_border.dart';
import '../color.dart';
import '../typography.dart';

class FDSButton extends StatelessWidget {
  const FDSButton({
    required this.text,
    super.key,
    this.size = FDSButtonSize.standard,
    this.type = FDSButtonType.contained,
    this.iconStart,
    this.iconEnd,
    this.onPressed,
    this.color = FDSButtonColor.primary,
  });

  final String text;
  final FDSButtonSize size;
  final FDSButtonType type;
  final SvgGenImage? iconStart;
  final SvgGenImage? iconEnd;
  final VoidCallback? onPressed;
  final FDSButtonColor color;

  @override
  Widget build(BuildContext context) {
    final iconStart = this.iconStart;
    final iconEnd = this.iconEnd;
    final isEnabled = onPressed != null;

    late BoxConstraints constraints;
    late BorderRadius borderRadius;
    late FDSTextStyle textStyle;
    late EdgeInsets padding;

    switch (size) {
      case FDSButtonSize.large:
        constraints = const BoxConstraints(
          maxHeight: 44.0,
          minHeight: 44.0,
        );
        borderRadius = BorderRadius.circular(24.0);
        textStyle = const FDSTypography.button1();
        padding = EdgeInsets.symmetric(
          vertical: context.theme.spacing.spacing2,
          horizontal: context.theme.spacing.spacing4,
        );
        break;
      case FDSButtonSize.standard:
        constraints = const BoxConstraints(
          maxHeight: 36.0,
          minHeight: 36.0,
        );
        borderRadius = BorderRadius.circular(18.0);
        textStyle = const FDSTypography.button2();
        padding = EdgeInsets.symmetric(
          vertical: context.theme.spacing.spacing1,
          horizontal: context.theme.spacing.spacing3,
        );
        break;
      case FDSButtonSize.dense:
        constraints = const BoxConstraints(
          maxHeight: 30.0,
          minHeight: 30.0,
        );
        borderRadius = BorderRadius.circular(18.0);
        textStyle = const FDSTypography.button3();
        padding = EdgeInsets.symmetric(
          vertical: context.theme.spacing.spacing1,
          horizontal: context.theme.spacing.spacing3,
        );
        break;
    }

    late FDSColor color;
    late FDSColor onColor;

    switch (this.color) {
      case FDSButtonColor.primary:
        color = context.theme.colorScheme.primary;
        onColor = context.theme.colorScheme.onPrimary;
        break;
      case FDSButtonColor.secondary:
        color = context.theme.colorScheme.secondary;
        onColor = context.theme.colorScheme.onSecondary;
        break;
      case FDSButtonColor.success:
        color = context.theme.colorScheme.success;
        onColor = context.theme.colorScheme.onPrimary;
        break;
      case FDSButtonColor.error:
        color = context.theme.colorScheme.error;
        onColor = context.theme.colorScheme.onPrimary;
        break;
    }

    late FDSColor textColor;
    late FDSColor? borderColor;
    late FDSColor? fillColor;
    late FDSColor? iconColor;

    switch (type) {
      case FDSButtonType.text:
        textColor =
            isEnabled ? color : context.theme.colorScheme.onSurfaceDisabled;
        borderColor = null;
        fillColor = null;
        iconColor = textColor;
        break;
      case FDSButtonType.outlined:
        textColor =
            isEnabled ? color : context.theme.colorScheme.onSurfaceDisabled;
        borderColor = isEnabled
            ? textColor
            : context.theme.colorScheme.outlineBorderOnSurface;
        fillColor = null;
        iconColor = textColor;
        break;
      case FDSButtonType.contained:
        textColor =
            isEnabled ? onColor : context.theme.colorScheme.onSurfaceDisabled;
        borderColor = null;
        fillColor =
            isEnabled ? color : context.theme.colorScheme.surfaceDisabled;
        iconColor = textColor;
        break;
    }

    final text = FDSText(
      this.text,
      textAlign: TextAlign.left,
      style: textStyle.copyWith(color: textColor),
    );

    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.opaque,
      child: Container(
        constraints: constraints,
        padding: padding,
        decoration: BoxDecoration(
          color: fillColor,
          border: type == FDSButtonType.outlined
              ? GradientBorder.all(
                  width: 1.0,
                  color: borderColor!,
                )
              : null,
          borderRadius: borderRadius,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconStart != null)
              iconStart.svg(
                colorFilter: ColorFilter.mode(
                  iconColor,
                  BlendMode.srcIn,
                ),
              ),
            Container(
              margin: EdgeInsets.only(
                left: iconStart != null
                    ? context.theme.spacing.spacing2
                    : context.theme.spacing.spacing0,
                right: iconEnd != null
                    ? context.theme.spacing.spacing2
                    : context.theme.spacing.spacing0,
              ),
              child: text,
            ),
            if (iconEnd != null)
              iconEnd.svg(
                colorFilter: ColorFilter.mode(
                  iconColor,
                  BlendMode.srcIn,
                ),
              )
          ],
        ),
      ),
    );
  }
}

enum FDSButtonSize {
  large,
  standard,
  dense,
}

enum FDSButtonType {
  text,
  outlined,
  contained,
}

enum FDSButtonColor {
  primary,
  secondary,
  success,
  error,
}
