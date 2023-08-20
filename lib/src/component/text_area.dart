import 'package:finastra_design_system/src/atom/base_text_field.dart';
import 'package:flutter/widgets.dart';

class FDSTextArea extends FDSBaseTextField {
  const FDSTextArea({
    super.key,
    super.controller,
    super.focusNode,
    super.onChanged,
    super.size,
    super.outsideLabel,
    super.insideLabel,
    super.helperText,
    super.hint,
    super.hasError,
    super.enabled,
    super.readOnly,
    super.iconLeft,
    super.iconRight,
  }) : super(
          height: 208,
          alignment: Alignment.topCenter,
          minLines: 6,
          maxLines: 6,
          insideLabelBehavior: FDSInsideLabelBehavior.alwaysVisible,
        );
}
