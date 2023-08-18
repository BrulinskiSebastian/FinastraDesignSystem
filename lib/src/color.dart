import 'package:flutter/widgets.dart';

@immutable
class FDSColor {
  const FDSColor(this.value);

  final int value;

  static const pink100 = FDSColor(0xFFF04E98);
  static const charcoal100 = FDSColor(0xFF414141);
  static const gray100 = FDSColor(0xFFC7C8CA);
  static const transparent = FDSColor(0x00000000);

  Color toColor() => Color(value);

  FDSColor withOpacity(double opacity) =>
      FDSColor(toColor().withOpacity(opacity).value);
}
