import 'package:fds_design_system_storybook/src/common/enum_ext.dart';
import 'package:fds_design_system_storybook/src/knob/knobs_builder_ext.dart';
import 'package:finastra_design_system/finastra_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final buttonStory = Story(
  name: 'Button',
  builder: (context) {
    return Center(
      child: FDSButton(
        text: context.knobs.text(
          label: 'text',
          initial: 'Button text',
        ),
        size: context.knobs.options(
          label: 'size',
          initial: FDSButtonSize.standard,
          options: FDSButtonSize.values.options(),
        ),
        type: context.knobs.options(
          label: 'type',
          initial: FDSButtonType.contained,
          options: FDSButtonType.values.options(),
        ),
        iconStart: context.knobs.icon(label: 'iconStart'),
        iconEnd: context.knobs.icon(label: 'iconEnd'),
        onPressed: context.knobs.boolean(
          label: 'onPressed',
          initial: true,
        )
            ? () {}
            : null,
        color: context.knobs.options(
          label: 'color',
          initial: FDSButtonColor.primary,
          options: FDSButtonColor.values.options(),
        ),
      ),
    );
  },
);
