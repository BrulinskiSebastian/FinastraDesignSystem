import 'package:flutter/widgets.dart';

import '../atom/base_text_field.dart';

class FDSTextField extends FDSBaseTextField {
  const FDSTextField({
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
          height: null,
          maxLines: 1,
          minLines: 1,
          alignment: Alignment.centerLeft,
          insideLabelBehavior: FDSInsideLabelBehavior.floating,
        );
}
