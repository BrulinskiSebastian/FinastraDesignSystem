import 'package:finastra_design_system/finastra_design_system.dart';
import 'package:flutter/widgets.dart';

class FDSTextField extends StatefulWidget {
  const FDSTextField({
    this.controller,
    this.focusNode,
    this.onChanged,
    this.size = FDSTextFieldSize.standard,
    this.label,
    this.helperText,
    this.hint,
    this.hasError = false,
    this.enabled = true,
    this.readOnly = false,
    this.iconLeft,
    this.iconRight,
    this.maxLines,
    this.minLines,
    super.key,
  }) : assert(
          minLines == null || minLines >= 1,
          'Min lines canno\'t be smaller than 1',
        );

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final FDSTextFieldSize size;
  final String? label;
  final String? helperText;
  final String? hint;
  final bool hasError;
  final bool readOnly;
  final bool enabled;
  final SvgGenImage? iconLeft;
  final SvgGenImage? iconRight;
  final int? maxLines;
  final int? minLines;

  @override
  State<FDSTextField> createState() => _FDSTextFieldState();
}

class _FDSTextFieldState extends State<FDSTextField> {
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
  void didUpdateWidget(covariant FDSTextField oldWidget) {
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

    late BoxConstraints constraints;
    late FDSColor fillColor;
    late FDSColor borderColor;
    FDSColor? leftIconColor;
    double? borderWidth;
    FDSTextStyle? textStyle;
    const defaultVerticalPadding = 13.5;
    double? verticalPadding;

    if (!widget.enabled) {
      fillColor = context.theme.colorScheme.surfaceDisabled;
      borderColor = context.theme.colorScheme.outlineBorderOnSurface;
      leftIconColor = context.theme.colorScheme.onSurfaceDisabled;
      textStyle = const FDSTypography.body2();
    } else if (widget.readOnly) {
      fillColor = FDSColor.transparent;
      borderColor = FDSColor.transparent;
      leftIconColor = context.theme.colorScheme.primary;
      borderWidth = 0.0;
    } else if (widget.hasError) {
      fillColor = context.theme.colorScheme.error.withOpacity(0.03);
      borderColor = context.theme.colorScheme.error;
    } else {
      fillColor = context.theme.colorScheme.primary.withOpacity(0.08);
      borderColor = hasFocus
          ? context.theme.colorScheme.primary
          : context.theme.colorScheme.outlineBorderOnSurface;
      leftIconColor = context.theme.colorScheme.primary;
    }

    switch (widget.size) {
      case FDSTextFieldSize.large:
        constraints = const BoxConstraints(minHeight: 64.0);
        verticalPadding = 20.0;
        break;
      case FDSTextFieldSize.standard:
        constraints = const BoxConstraints(minHeight: 48.0);
        break;
      case FDSTextFieldSize.dense:
        constraints = const BoxConstraints(minHeight: 40.0);
        verticalPadding = 11.0;
        break;
    }

    final iconLeft = widget.iconLeft?.svg(
      width: 22.0,
      colorFilter: ColorFilter.mode(
        leftIconColor?.toColor() ?? borderColor.toColor(),
        BlendMode.srcIn,
      ),
    );
    final iconRight = widget.iconRight?.svg(width: 22.0);
    final hint = widget.hint;
    final label = widget.label;
    final helperText = widget.helperText;
    final minLines = widget.minLines;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          FDSText(label, style: const FDSTypography.body2()),
          Gap(context.theme.spacing.spacing1),
        ],
        FDSContainer(
          constraints: constraints,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
            top: verticalPadding ?? defaultVerticalPadding,
            bottom: verticalPadding ?? defaultVerticalPadding,
          ),
          color: hasFocus ? fillColor : context.theme.colorScheme.surface,
          borderType: FDSBorderType.inside,
          border: Border.all(
            width: hasFocus ? borderWidth ?? 2.0 : 1.0,
            color: borderColor.toColor(),
          ),
          borderRadius: BorderRadius.circular(4.0),
          child: Row(
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              if (iconLeft != null) ...[
                Gap(context.theme.spacing.spacing3),
                iconLeft,
                Gap(context.theme.spacing.spacing2),
              ] else
                Gap(context.theme.spacing.spacing3),
              Expanded(
                child: Stack(
                  alignment: minLines == null || minLines == 1
                      ? Alignment.centerLeft
                      : Alignment.topLeft,
                  children: [
                    EditableText(
                      controller: controller,
                      focusNode: focusNode,
                      maxLines: widget.maxLines,
                      minLines: widget.minLines,
                      style: textStyle?.toTextStyle() ??
                          const FDSTypography.subtitle2().toTextStyle(),
                      cursorColor: borderColor.toColor(),
                      cursorWidth: 1.0,
                      cursorOffset: isEmpty ? null : const Offset(8.0, 0),
                      backgroundCursorColor:
                          context.theme.colorScheme.primary.toColor(),
                      readOnly: !widget.enabled || widget.readOnly,
                      onChanged: (value) {
                        setState(() {});
                        widget.onChanged?.call(value);
                      },
                    ),
                    if (isEmpty && hint != null)
                      IgnorePointer(
                        child: FDSText(
                          hint,
                          maxLines: widget.maxLines,
                          style: const FDSTypography.body2(),
                        ),
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
        if (helperText != null)
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                  top: context.theme.spacing.spacing1,
                  left: context.theme.spacing.spacing3),
              child: FDSText(
                helperText,
                style: const FDSTypography.caption().copyWith(
                  color: context.theme.colorScheme.onSurface.withOpacity(0.54),
                ),
              ),
            ),
          ),
      ],
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

enum FDSTextFieldSize {
  large,
  standard,
  dense,
}
