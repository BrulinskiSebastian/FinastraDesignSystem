import 'package:finastra_design_system/gen/fonts.gen.dart';
import 'package:finastra_design_system/src/color.dart';
import 'package:flutter/widgets.dart';

class FDSText extends StatelessWidget {
  const FDSText(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow = TextOverflow.clip,
    this.textAlign = TextAlign.start,
  });

  final String text;
  final FDSTextStyle? style;
  final int? maxLines;
  final TextOverflow overflow;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      text: TextSpan(
        text: text,
        style: const FDSTextStyle(
          fontFamily: FDSFont.roboto,
        ).merge(style).toTextStyle(),
      ),
    );
  }
}

class FDSTextStyle {
  const FDSTextStyle({
    this.fontFamily = FDSFont.roboto,
    this.color = FDSColor.charcoal100,
    this.fontSize,
    this.fontWeight,
    this.lineHeight,
  });

  final String fontFamily;
  final FDSColor color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? lineHeight;

  FDSTextStyle copyWith({
    String? fontFamily,
    FDSColor? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? lineHeight,
  }) {
    return FDSTextStyle(
      fontFamily: fontFamily ?? this.fontFamily,
      color: color ?? this.color,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      lineHeight: lineHeight ?? this.lineHeight,
    );
  }

  FDSTextStyle merge(FDSTextStyle? other) {
    if (other == null) {
      return this;
    }

    return copyWith(
      fontFamily: other.fontFamily,
      color: other.color,
      fontSize: other.fontSize,
      fontWeight: other.fontWeight,
      lineHeight: other.lineHeight,
    );
  }

  TextStyle toTextStyle() {
    return TextStyle(
      fontFamily: fontFamily,
      color: color.toColor(),
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: lineHeight,
    );
  }
}
