import 'package:fds_design_system_storybook/src/common/enum_ext.dart';
import 'package:fds_design_system_storybook/src/common/string_ext.dart';
import 'package:fds_design_system_storybook/src/knob/knobs_builder_ext.dart';
import 'package:finastra_design_system/finastra_design_system.dart';
import 'package:flutter/widgets.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final textFieldStory = Story(
  name: 'TextField & TextArea',
  builder: (context) {
    final textFieldController = TextEditingController();
    final textAreaController = TextEditingController();

    return LayoutBuilder(
      builder: (context, constraints) {
        final size = context.knobs.options(
          label: 'size',
          initial: FDSTextFieldSize.standard,
          options: FDSTextFieldSize.values.options(),
        );

        final labelType = context.knobs.options(
          label: 'Label type',
          initial: _LabelType.values.first,
          options: _LabelType.values.options(),
        );

        final label = context.knobs.text(
          label: 'Label',
          initial: 'Label text',
        );

        final helperText = context.knobs
            .text(label: 'helperText', initial: 'Helper text')
            .takeIfNotNull();

        final hint = context.knobs
            .text(label: 'hint', initial: 'Hint text')
            .takeIfNotNull();

        final hasError = context.knobs.boolean(label: 'hasError');
        final enabled = context.knobs.boolean(label: 'enabled', initial: true);
        final readOnly = context.knobs.boolean(
          label: 'readOnly',
          initial: false,
        );
        final iconLeft = context.knobs.icon(label: 'iconLeft');
        final iconRight = context.knobs.icon(label: 'iconRight');

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: constraints.maxWidth * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FDSTextField(
                    controller: textFieldController,
                    size: size,
                    outsideLabel:
                        labelType == _LabelType.outside ? label : null,
                    insideLabel: labelType == _LabelType.inside ? label : null,
                    helperText: helperText,
                    hint: hint,
                    hasError: hasError,
                    enabled: enabled,
                    readOnly: readOnly,
                    iconLeft: iconLeft,
                    iconRight: iconRight,
                  ),
                  const Gap(56),
                  FDSTextArea(
                    controller: textAreaController,
                    size: size,
                    outsideLabel:
                        labelType == _LabelType.outside ? label : null,
                    insideLabel: labelType == _LabelType.inside ? label : null,
                    helperText: helperText,
                    hint: hint,
                    hasError: hasError,
                    enabled: enabled,
                    readOnly: readOnly,
                    iconLeft: iconLeft,
                    iconRight: iconRight,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  },
);

enum _LabelType {
  outside,
  inside,
}
