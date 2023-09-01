import 'package:fds_design_system_storybook/src/common/enum_ext.dart';
import 'package:fds_design_system_storybook/src/knob/knobs_builder_ext.dart';
import 'package:finastra_design_system/finastra_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final buttonToggleStory = Story(
  name: 'ButtonToggle',
  builder: (context) {
    int? selectedValue = 0;

    return StatefulBuilder(builder: (context, setState) {
      const maxItemsCount = 6;

      final itemsCount = context.knobs.sliderInt(
        label: 'items count',
        initial: 4,
        min: 2,
        max: maxItemsCount,
      );

      final size = context.knobs.options(
        label: 'size',
        initial: FDSButtonToggleSize.standard,
        options: FDSButtonToggleSize.values.options(),
      );

      final itemOrientation = context.knobs.options(
        label: 'itemOrientation',
        initial: FDSButtonToggleItemOrientation.horizontal,
        options: FDSButtonToggleItemOrientation.values.options(),
      );

      final icons = [
        for (var i = 0; i < maxItemsCount; i++)
          context.knobs.icon(label: 'Item ${i + 1} icon')
      ];

      final badgeStyle = <int, FDSBadgeStyle>{};
      final badgeText = <int, String>{};

      for (var i = 0; i < maxItemsCount; i++) {
        badgeStyle[i] = context.knobs.options(
          label: 'Item ${i + 1} badge style',
          initial: FDSBadgeStyle.values.first,
          options: FDSBadgeStyle.values.options(),
        );
        badgeText[i] = context.knobs.text(
          label: 'Item ${i + 1} badge text',
          initial: '',
        );
      }

      final items = [
        for (var i = 0; i < itemsCount; i++)
          FDSButtonToggleItem(
            value: i,
            icon: icons[i],
            text: 'Item ${i + 1}',
            badge: badgeText[i]!.isNotEmpty
                ? FDSBadge(
                    style: badgeStyle[i]!,
                    text: badgeText[i]!,
                  )
                : null,
          ),
      ];
      return Center(
        child: FittedBox(
          child: FDSButtonToggle<int>(
            items: items,
            value: selectedValue,
            size: size,
            itemOrientation: itemOrientation,
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
          ),
        ),
      );
    });
  },
);
