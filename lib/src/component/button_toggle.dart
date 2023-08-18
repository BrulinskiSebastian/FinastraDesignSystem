import 'package:finastra_design_system/finastra_design_system.dart';
import 'package:flutter/widgets.dart';

class FDSButtonToggle<T> extends StatelessWidget {
  const FDSButtonToggle({
    required this.items,
    this.value,
    this.size = FDSButtonToggleSize.standard,
    this.itemOrientation = FDSButtonToggleItemOrientation.horizontal,
    this.onChanged,
    super.key,
  }) : assert(
          items.length >= 2,
          'FDSButtonToggle should have minimum 2 items',
        );

  final T? value;
  final List<FDSButtonToggleItem<T>> items;
  final FDSButtonToggleSize size;
  final FDSButtonToggleItemOrientation itemOrientation;
  final ValueChanged<T?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface.toColor(),
        border: Border.all(
          color: context.theme.colorScheme.outlineBorderOnSurface.toColor(),
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        textBaseline: TextBaseline.alphabetic,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: [
          for (final item in items)
            _FDSButtonToggleItemWidget(
              key: ValueKey(item),
              isSelected: item.value == value,
              orientation: itemOrientation,
              size: size,
              onTap: () => onChanged?.call(item.value),
              item: item,
            )
        ],
      ),
    );
  }
}

class _FDSButtonToggleItemWidget extends StatelessWidget {
  const _FDSButtonToggleItemWidget({
    required this.isSelected,
    required this.orientation,
    required this.size,
    required this.onTap,
    required this.item,
    super.key,
  });

  final bool isSelected;
  final FDSButtonToggleItemOrientation orientation;
  final FDSButtonToggleSize size;
  final VoidCallback onTap;
  final FDSButtonToggleItem item;

  @override
  Widget build(BuildContext context) {
    late FDSTextStyle textStyle;
    late EdgeInsets padding;

    switch (size) {
      case FDSButtonToggleSize.large:
        textStyle = const FDSTypography.subtitle1();
        padding = const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0);
        break;
      case FDSButtonToggleSize.standard:
        textStyle = const FDSTypography.subtitle2();
        padding = const EdgeInsets.symmetric(vertical: 7.5, horizontal: 16.0);
        break;
      case FDSButtonToggleSize.dense:
        textStyle = const FDSTypography.subtitle1();
        padding = const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0);
        break;
      case FDSButtonToggleSize.extraDense:
        textStyle = const FDSTypography.subtitle1();
        padding = const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0);
        break;
    }

    final text = item.text;
    final icon = item.icon;
    final badge = item.badge;

    final iconWidget = icon?.svg(
      fit: BoxFit.scaleDown,
      colorFilter: ColorFilter.mode(
        isSelected
            ? context.theme.colorScheme.primary.toColor()
            : context.theme.colorScheme.onSurfaceDisabled.toColor(),
        BlendMode.srcIn,
      ),
    );

    final textWidget = text != null
        ? FDSText(
            text,
            style: textStyle.copyWith(
              color: isSelected
                  ? context.theme.colorScheme.primary
                  : context.theme.colorScheme.onSurface.withOpacity(0.54),
            ),
          )
        : null;

    late Widget child;

    switch (orientation) {
      case FDSButtonToggleItemOrientation.vertical:
        child = Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (iconWidget != null) iconWidget,
            if (badge != null || textWidget != null)
              Gap(context.theme.spacing.spacing1),
            if (badge == null && textWidget != null) textWidget,
            if (badge != null && textWidget != null)
              Row(
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: textWidget,
                  ),
                  Gap(context.theme.spacing.spacing2),
                  badge,
                ],
              ),
          ],
        );
        break;
      case FDSButtonToggleItemOrientation.horizontal:
        child = Row(
          mainAxisSize: MainAxisSize.min,
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            if (iconWidget != null) iconWidget,
            if (iconWidget != null && textWidget != null)
              Gap(context.theme.spacing.spacing2),
            if (textWidget != null) textWidget,
            if (textWidget != null && badge != null)
              Gap(context.theme.spacing.spacing2),
            if (badge != null) badge,
          ],
        );
        break;
    }

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: padding,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected
              ? context.theme.colorScheme.primary.withOpacity(0.2).toColor()
              : null,
          border: Border.all(
            color: isSelected
                ? context.theme.colorScheme.primary.toColor()
                : FDSColor.transparent.toColor(),
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: child,
      ),
    );
  }
}

enum FDSButtonToggleSize {
  large,
  standard,
  dense,
  extraDense,
}

enum FDSButtonToggleItemOrientation {
  vertical,
  horizontal,
}
