import 'package:finastra_design_system/finastra_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// TODO(sb): Counter
// TODO(sb): Right icon
// TODO(sb): Selection
// TODO(sb): Label color
class FDSBaseTextField extends StatefulWidget {
  const FDSBaseTextField({
    this.controller,
    this.focusNode,
    this.onChanged,
    this.size = FDSTextFieldSize.standard,
    this.insideLabel,
    this.insideLabelBehavior = FDSInsideLabelBehavior.floating,
    this.outsideLabel,
    this.helperText,
    this.hint,
    this.hasError = false,
    this.enabled = true,
    this.readOnly = false,
    this.iconLeft,
    this.iconRight,
    this.maxLines,
    this.minLines,
    this.height,
    this.alignment,
    super.key,
  })  : assert(
          minLines == null || minLines >= 1,
          'Min lines canno\'t be smaller than 1',
        ),
        assert(
          outsideLabel == null || insideLabel == null,
          'Only one label can be specified',
        ),
        assert(
          outsideLabel != null || insideLabel != null,
          'Inside or outside label must be specified',
        );

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final FDSTextFieldSize size;
  final String? outsideLabel;
  final String? insideLabel;
  final FDSInsideLabelBehavior insideLabelBehavior;
  final String? helperText;
  final String? hint;
  final bool hasError;
  final bool readOnly;
  final bool enabled;
  final SvgGenImage? iconLeft;
  final SvgGenImage? iconRight;
  final int? maxLines;
  final int? minLines;
  final double? height;
  final AlignmentGeometry? alignment;

  @override
  State<FDSBaseTextField> createState() => _FDSBaseTextFieldState();
}

class _FDSBaseTextFieldState extends State<FDSBaseTextField> {
  TextEditingController? innerController;
  FocusNode? innerFocusNode;
  late FocusNode focusNode;
  late bool hasFocus;

  @override
  void initState() {
    super.initState();
    setupFocusNode(
      focusNode = widget.focusNode ?? (innerFocusNode = FocusNode()),
    );
  }

  @override
  void didUpdateWidget(covariant FDSBaseTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      innerController?.dispose();
      if (widget.controller == null) {
        innerController = TextEditingController();
      } else {
        innerController = null;
      }
    }

    final newFocusNode = widget.focusNode;
    if (oldWidget.focusNode != newFocusNode) {
      oldWidget.focusNode?.removeListener(isFocusedListener);
      innerFocusNode?.dispose();

      if (newFocusNode == null) {
        setupFocusNode(focusNode = (innerFocusNode = FocusNode()));
      } else {
        innerFocusNode = null;
        setupFocusNode(focusNode = newFocusNode);
      }
    }

    if (oldWidget.enabled && !widget.enabled) {
      focusNode.unfocus();
    }
  }

  @override
  void dispose() {
    innerController?.dispose();
    innerFocusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller =
        widget.controller ?? (innerController ??= TextEditingController());
    final bool isEmpty = controller.text.isEmpty;

    late FDSColor fillColor;
    late FDSColor borderColor;
    FDSColor? leftIconColor;
    double? borderWidth;

    if (!widget.enabled) {
      fillColor = context.theme.colorScheme.surfaceDisabled;
      borderColor = context.theme.colorScheme.outlineBorderOnSurface;
      leftIconColor = context.theme.colorScheme.onSurfaceDisabled;
    } else if (widget.readOnly) {
      fillColor = FDSColor.transparent;
      borderColor = FDSColor.transparent;
      leftIconColor = context.theme.colorScheme.primary;
      borderWidth = 0.0;
    } else if (widget.hasError) {
      fillColor = hasFocus
          ? context.theme.colorScheme.error.withOpacity(0.03)
          : context.theme.colorScheme.surface;
      borderColor = context.theme.colorScheme.error;
    } else {
      fillColor = hasFocus
          ? context.theme.colorScheme.primary.withOpacity(0.08)
          : context.theme.colorScheme.surface;
      borderColor = hasFocus
          ? context.theme.colorScheme.primary
          : context.theme.colorScheme.outlineBorderOnSurface;
      leftIconColor = context.theme.colorScheme.primary;
    }

    late double iconSize;
    late FDSTextStyle textStyle;
    late FDSTextStyle labelStyle;
    late double height;
    late double paddingTop;
    late double paddingBottom;

    final outsideLabel = widget.outsideLabel;
    final insideLabel = widget.insideLabel;

    switch (widget.size) {
      case FDSTextFieldSize.large:
        paddingTop = insideLabel != null ? 15 : 20.0;
        paddingBottom = insideLabel != null ? 14 : 20.0;
        iconSize = 28.0;
        textStyle = const FDSTextStyle(
          fontSize: 16.0,
          lineHeight: 1.5,
          fontWeight: FDSTypography.weightMedium,
        );
        labelStyle = const FDSTypography.body2().copyWith();
        height = widget.height ?? 74.0;
        break;
      case FDSTextFieldSize.standard:
        paddingTop = insideLabel != null ? 10.0 : 13.5;
        paddingBottom = insideLabel != null ? 9.0 : 13.5;
        iconSize = 24.0;
        textStyle = const FDSTextStyle(
          fontSize: 14.0,
          lineHeight: 1.5,
          fontWeight: FDSTypography.weightMedium,
        );
        labelStyle = const FDSTypography.body3();
        height = widget.height ?? 58.0;
        break;
      case FDSTextFieldSize.dense:
        paddingTop = insideLabel != null ? 9.0 : 11.0;
        paddingBottom = insideLabel != null ? 8.0 : 11.0;
        iconSize = 18.0;
        textStyle = const FDSTypography.subtitle3();
        labelStyle = const FDSTypography.body4();
        height = widget.height ?? 53.0;
        break;
    }

    final effectiveLeftIconColor = leftIconColor ?? borderColor;
    final effectiveLabelStyle = widget.insideLabel != null &&
            widget.insideLabelBehavior == FDSInsideLabelBehavior.floating &&
            isEmpty &&
            !hasFocus
        ? textStyle.copyWith(fontWeight: FDSTypography.weightLight)
        : labelStyle;

    final insideLabelStyle = effectiveLabelStyle.copyWith(
      color: effectiveLeftIconColor,
    );
    final iconLeft = widget.iconLeft?.svg(
      width: iconSize,
      height: iconSize,
      colorFilter: ColorFilter.mode(
        effectiveLeftIconColor.toColor(),
        BlendMode.srcIn,
      ),
    );
    final iconRight = widget.iconRight?.svg(width: iconSize, height: iconSize);
    final hint = widget.hint;

    final helperText = widget.helperText;
    final isActive = widget.enabled && !widget.readOnly;

    return IgnorePointer(
      ignoring: !isActive,
      child: GestureDetector(
        onTap: focusNode.requestFocus,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (outsideLabel != null) ...[
              FDSText(outsideLabel, style: effectiveLabelStyle),
              Gap(context.theme.spacing.spacing1),
            ],
            FDSContainer(
              constraints: BoxConstraints(maxHeight: height, minHeight: height),
              alignment: widget.alignment,
              padding: EdgeInsets.only(top: paddingTop, bottom: paddingBottom),
              color: fillColor,
              borderType: FDSBorderType.inside,
              border: Border.all(
                width: hasFocus ? borderWidth ?? 2.0 : 1.0,
                color: borderColor.toColor(),
              ),
              borderRadius: BorderRadius.circular(4.0),
              child: Row(
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: widget.insideLabelBehavior ==
                        FDSInsideLabelBehavior.floating
                    ? !isEmpty || hasFocus
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.baseline
                    : CrossAxisAlignment.start,
                children: [
                  if (iconLeft != null) ...[
                    Gap(context.theme.spacing.spacing3),
                    iconLeft,
                    Gap(context.theme.spacing.spacing2),
                  ] else
                    Gap(context.theme.spacing.spacing3),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (insideLabel != null &&
                            (!isEmpty ||
                                hasFocus ||
                                widget.insideLabelBehavior ==
                                    FDSInsideLabelBehavior.alwaysVisible)) ...[
                          FDSText(
                            insideLabel,
                            style: insideLabelStyle,
                          ),
                        ],
                        Stack(
                          children: [
                            Flexible(
                              child: EditableText(
                                controller: controller,
                                focusNode: focusNode,
                                maxLines: widget.maxLines,
                                minLines: widget.minLines,
                                style: textStyle
                                    .copyWith(
                                        color:
                                            context.theme.colorScheme.onSurface)
                                    .toTextStyle(),
                                scrollPadding: EdgeInsets.zero,
                                cursorColor: borderColor.toColor(),
                                cursorWidth: 1.0,
                                cursorOffset:
                                    isEmpty ? null : const Offset(8.0, 0),
                                backgroundCursorColor:
                                    context.theme.colorScheme.primary.toColor(),
                                readOnly: !isActive,
                                onChanged: (value) {
                                  setState(() {});
                                  widget.onChanged?.call(value);
                                },
                              ),
                            ),
                            if (hint != null &&
                                isEmpty &&
                                (widget.insideLabelBehavior ==
                                        FDSInsideLabelBehavior.floating
                                    ? hasFocus
                                    : true))
                              IgnorePointer(
                                child: FDSText(
                                  hint,
                                  maxLines: widget.maxLines,
                                  style: textStyle.copyWith(
                                    fontWeight: FDSTypography.weightLight,
                                    color: context.theme.colorScheme.onSurface
                                        .withOpacity(0.54),
                                  ),
                                ),
                              )
                            else if (insideLabel != null &&
                                isEmpty &&
                                !hasFocus)
                              IgnorePointer(
                                child: FDSText(
                                  insideLabel,
                                  maxLines: widget.maxLines,
                                  style: effectiveLabelStyle,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (iconRight != null) ...[
                    Gap(context.theme.spacing.spacing2),
                    iconRight,
                    Gap(context.theme.spacing.spacing2 * 1.5),
                  ] else
                    Gap(context.theme.spacing.spacing2 * 1.5),
                ],
              ),
            ),
            if (helperText != null && !widget.readOnly)
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: context.theme.spacing.spacing1,
                      left: context.theme.spacing.spacing3),
                  child: FDSText(
                    helperText,
                    style: const FDSTypography.caption().copyWith(
                      color: widget.hasError
                          ? context.theme.colorScheme.error
                          : context.theme.colorScheme.onSurface
                              .withOpacity(0.54),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void setupFocusNode(FocusNode focusNode) {
    focusNode.addListener(isFocusedListener);
    hasFocus = focusNode.hasFocus;
  }

  void isFocusedListener() {
    setState(() {
      hasFocus = focusNode.hasFocus;
    });
  }
}

enum FDSInsideLabelBehavior {
  floating,
  alwaysVisible,
}
