import 'package:fds_design_system_storybook/src/story/spacing_story.dart';
import 'package:fds_design_system_storybook/src/story/text_field_story.dart';
import 'package:fds_design_system_storybook/src/story/typography_story.dart';
import 'package:finastra_design_system/finastra_design_system.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'story/badge_story.dart';
import 'story/button_story.dart';
import 'story/button_toggle.dart';

class FinastraStorybook extends StatefulWidget {
  const FinastraStorybook({super.key});

  @override
  State<FinastraStorybook> createState() => _FinastraStorybookState();
}

class _FinastraStorybookState extends State<FinastraStorybook> {
  late ThemeMode themeMode;

  @override
  void initState() {
    super.initState();
    themeMode = ThemeMode.system;
  }

  @override
  Widget build(BuildContext context) {
    late FDSColorScheme colorScheme;
    switch (themeMode) {
      case ThemeMode.system:
        final brightness = PlatformDispatcher.instance.platformBrightness;
        colorScheme = brightness == Brightness.light
            ? const FDSColorScheme.light()
            : const FDSColorScheme.dark();
        break;
      case ThemeMode.light:
        colorScheme = const FDSColorScheme.light();
        break;
      case ThemeMode.dark:
        colorScheme = const FDSColorScheme.dark();
        break;
    }

    return FDSTheme(
      themeData: FDSThemeData(colorScheme: colorScheme),
      child: Storybook(
        plugins: [
          ...initializePlugins(enableThemeMode: false),
          ThemeModePlugin(
            initialTheme: themeMode,
            onThemeChanged: (value) {
              setState(() {
                themeMode = value;
              });
            },
          ),
        ],
        wrapperBuilder: (context, child) {
          return Container(
            color: colorScheme.background.toColor(),
            child: child,
          );
        },
        stories: [
          badgeStory,
          buttonStory,
          buttonToggleStory,
          spacingStory,
          textFieldStory,
          typographyStory
        ],
      ),
    );
  }
}
