import 'package:finastra_design_system/finastra_design_system.dart';
import 'package:flutter/widgets.dart';

class FDSBadge extends StatelessWidget {
  const FDSBadge({
    required this.style,
    required this.text,
    super.key,
  });

  final FDSBadgeStyle style;
  final String text;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(12.0);

    late FDSColor color;
    late FDSColor textColor;
    late Border? border;
    late List<BoxShadow> shadow;

    border = Border.all(
      width: 2.0,
      color: context.theme.colorScheme.surface.toColor(),
    );

    Border createBorder({double? width, FDSColor? color}) => Border.all(
          width: width ?? 2.0,
          color:
              color?.toColor() ?? context.theme.colorScheme.surface.toColor(),
        );

    switch (style) {
      case FDSBadgeStyle.outlined:
        color = FDSColor.transparent;
        textColor = context.theme.colorScheme.onSurface.withOpacity(0.54);
        border = createBorder(
          width: 1.0,
          color: context.theme.colorScheme.outlineBorderOnSurface,
        );
        shadow = context.theme.elevation.e00;
        break;
      case FDSBadgeStyle.white:
        color = context.theme.colorScheme.surface;
        textColor = context.theme.colorScheme.onSurface.withOpacity(0.54);
        border = createBorder(
          width: 1.0,
          color: color,
        );
        shadow = context.theme.elevation.e01;
        break;
      case FDSBadgeStyle.primary:
        color = context.theme.colorScheme.primary;
        textColor = context.theme.colorScheme.onPrimary;
        border = createBorder();
        shadow = context.theme.elevation.e01;
        break;
      case FDSBadgeStyle.secondary:
        color = context.theme.colorScheme.secondary;
        textColor = context.theme.colorScheme.onSecondary;
        border = createBorder();
        shadow = context.theme.elevation.e01;
        break;
      case FDSBadgeStyle.success:
        color = context.theme.colorScheme.success;
        textColor = context.theme.colorScheme.onSuccess;
        border = createBorder();
        shadow = context.theme.elevation.e01;
        break;
      case FDSBadgeStyle.error:
        color = context.theme.colorScheme.error;
        textColor = context.theme.colorScheme.onError;
        border = createBorder();
        shadow = context.theme.elevation.e01;
        break;
    }

    return FDSContainer(
      color: color,
      borderRadius: borderRadius,
      border: border,
      boxShadow: shadow,
      child: FDSContainer(
        padding: const EdgeInsets.symmetric(
          horizontal: 6.0,
          vertical: 1.0,
        ),
        borderRadius: borderRadius,
        child: FDSText(
          text,
          textAlign: TextAlign.center,
          style: const FDSTypography.subtitle4().copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}

enum FDSBadgeStyle {
  outlined,
  white,
  primary,
  secondary,
  success,
  error,
}
