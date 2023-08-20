import 'package:finastra_design_system/gen/fonts.gen.dart';
import 'package:flutter/widgets.dart';

import '../finastra_design_system.dart';

@immutable
class FDSTypography extends FDSTextStyle {
  const FDSTypography.headline1()
      : super(
          fontFamily: FDSFont.spartan,
          fontSize: 51,
          lineHeight: 1.4,
          fontWeight: weightExtraBold,
        );

  const FDSTypography.headline2()
      : super(
          fontFamily: FDSFont.spartan,
          fontSize: 41,
          lineHeight: 1.4,
          fontWeight: weightExtraBold,
        );

  const FDSTypography.headline3()
      : super(
          fontFamily: FDSFont.spartan,
          fontSize: 28,
          lineHeight: 1.4,
          fontWeight: weightExtraBold,
        );

  const FDSTypography.headline4()
      : super(
          fontFamily: FDSFont.spartan,
          fontSize: 21,
          lineHeight: 1.4,
          fontWeight: weightExtraBold,
        );

  const FDSTypography.headline5()
      : super(
          fontFamily: FDSFont.spartan,
          fontSize: 16,
          lineHeight: 1.37,
          fontWeight: weightExtraBold,
        );

  const FDSTypography.headline6()
      : super(
          fontFamily: FDSFont.spartan,
          fontSize: 13,
          lineHeight: 1.38,
          fontWeight: weightExtraBold,
        );

  const FDSTypography.subtitle1()
      : super(
          fontFamily: FDSFont.roboto,
          fontSize: 16,
          lineHeight: 1.5,
          fontWeight: weightMedium,
        );

  const FDSTypography.subtitle2()
      : super(
          fontFamily: FDSFont.roboto,
          fontSize: 14,
          lineHeight: 1.5,
          fontWeight: weightMedium,
        );

  const FDSTypography.subtitle3()
      : super(
          fontFamily: FDSFont.roboto,
          fontSize: 12,
          lineHeight: 1.5,
          fontWeight: weightMedium,
        );

  const FDSTypography.subtitle4()
      : super(
          fontFamily: FDSFont.roboto,
          fontSize: 10,
          lineHeight: 1.5,
          fontWeight: weightMedium,
        );

  const FDSTypography.body1()
      : super(
          fontFamily: FDSFont.roboto,
          fontSize: 16,
          lineHeight: 1.5,
          fontWeight: weightLight,
        );

  const FDSTypography.body2()
      : super(
          fontFamily: FDSFont.roboto,
          fontSize: 14,
          lineHeight: 1.5,
          fontWeight: weightLight,
        );

  const FDSTypography.body3()
      : super(
          fontFamily: FDSFont.roboto,
          fontSize: 12,
          lineHeight: 1.5,
          fontWeight: weightLight,
        );

  const FDSTypography.body4()
      : super(
          fontFamily: FDSFont.roboto,
          fontSize: 10,
          lineHeight: 1.5,
          fontWeight: weightLight,
        );

  const FDSTypography.button1()
      : super(
          fontFamily: FDSFont.roboto,
          fontSize: 16,
          lineHeight: 1.5,
          fontWeight: weightBold,
        );

  const FDSTypography.button2()
      : super(
          fontFamily: FDSFont.roboto,
          fontSize: 14,
          lineHeight: 1.42,
          fontWeight: weightBold,
        );

  const FDSTypography.button3()
      : super(
          fontFamily: FDSFont.roboto,
          fontSize: 12,
          lineHeight: 1.5,
          fontWeight: weightBold,
        );

  const FDSTypography.caption()
      : super(
          fontFamily: FDSFont.roboto,
          fontSize: 12,
          lineHeight: 1.5,
          fontWeight: weightRegular,
        );

  const FDSTypography.overline()
      : super(
          fontFamily: FDSFont.roboto,
          fontSize: 10,
          lineHeight: 1.5,
          fontWeight: weightRegular,
        );

  static const FontWeight weightLight = FontWeight.w300;
  static const FontWeight weightRegular = FontWeight.w400;
  static const FontWeight weightMedium = FontWeight.w500;
  static const FontWeight weightBold = FontWeight.w700;
  static const FontWeight weightExtraBold = FontWeight.w800;
}
