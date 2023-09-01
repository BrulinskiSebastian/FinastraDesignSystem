import 'package:finastra_design_system/finastra_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final spacingStory = Story(
  name: 'Spacing (standard)',
  builder: (context) {
    const spacing = FDSSpacing.standard();
    Widget buildSpacing(double spacing) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              constraints: BoxConstraints(
                maxHeight: spacing,
                maxWidth: spacing,
                minHeight: spacing,
                minWidth: spacing,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.theme.colorScheme.primary.toColor(),
                    context.theme.colorScheme.secondary.toColor(),
                  ],
                ),
              ),
            ),
            FDSText(
              '$spacing px',
              style: const FDSTypography.subtitle3().copyWith(
                color: context.theme.colorScheme.onBackground,
              ),
            ),
          ],
        );
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          buildSpacing(spacing.spacing0),
          buildSpacing(spacing.spacing1),
          buildSpacing(spacing.spacing2),
          buildSpacing(spacing.spacing3),
          buildSpacing(spacing.spacing4),
          buildSpacing(spacing.spacing5),
          buildSpacing(spacing.spacing6),
          buildSpacing(spacing.spacing7),
        ],
      ),
    );
  },
);
