import 'package:finastra_design_system/finastra_design_system.dart';
import 'package:flutter/widgets.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final typographyStory = Story(
  name: 'Typography',
  builder: (context) {
    Widget buildText({required String text, required FDSTextStyle style}) =>
        FDSText(
          text,
          style: style.copyWith(
            color: context.theme.colorScheme.onBackground,
          ),
        );

    return ListView(
      padding: const EdgeInsets.all(24.0),
      children: [
        buildText(
          text: 'Headline1',
          style: const FDSTypography.headline1(),
        ),
        buildText(
          text: 'Headline 2',
          style: const FDSTypography.headline2(),
        ),
        buildText(
          text: 'Headline 3',
          style: const FDSTypography.headline3(),
        ),
        buildText(
          text: 'Headline 4',
          style: const FDSTypography.headline4(),
        ),
        buildText(
          text: 'Headline 5',
          style: const FDSTypography.headline5(),
        ),
        buildText(
          text: 'Headline 6',
          style: const FDSTypography.headline6(),
        ),
        buildText(
          text: 'Subtitle 1',
          style: const FDSTypography.subtitle1(),
        ),
        buildText(
          text: 'Subtitle 2',
          style: const FDSTypography.subtitle2(),
        ),
        buildText(
          text: 'Subtitle 3',
          style: const FDSTypography.subtitle3(),
        ),
        buildText(
          text: 'Subtitle 4',
          style: const FDSTypography.subtitle4(),
        ),
        buildText(
          text: 'Body 1',
          style: const FDSTypography.body1(),
        ),
        buildText(
          text: 'Body 2',
          style: const FDSTypography.body2(),
        ),
        buildText(
          text: 'Body 3',
          style: const FDSTypography.body3(),
        ),
        buildText(
          text: 'Body 4',
          style: const FDSTypography.body4(),
        ),
        buildText(
          text: 'Button 1',
          style: const FDSTypography.button1(),
        ),
        buildText(
          text: 'Button 2',
          style: const FDSTypography.button2(),
        ),
        buildText(
          text: 'Button 3',
          style: const FDSTypography.button3(),
        ),
        buildText(
          text: 'Caption',
          style: const FDSTypography.caption(),
        ),
        buildText(
          text: 'Overline',
          style: const FDSTypography.overline(),
        ),
      ],
    );
  },
);
