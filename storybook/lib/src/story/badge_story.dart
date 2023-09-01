import 'package:fds_design_system_storybook/src/common/enum_ext.dart';
import 'package:finastra_design_system/finastra_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final badgeStory = Story(
  name: 'Badge',
  builder: (context) {
    return Center(
      child: FDSBadge(
        style: context.knobs.options(
          label: 'style',
          initial: FDSBadgeStyle.values.first,
          options: FDSBadgeStyle.values.options(),
        ),
        text: context.knobs.text(label: 'text', initial: '9+'),
      ),
    );
  },
);
