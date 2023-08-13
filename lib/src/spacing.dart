import 'package:flutter/foundation.dart';

@immutable
class FDSSpacing {
  const FDSSpacing({
    required this.spacing0,
    required this.spacing1,
    required this.spacing2,
    required this.spacing3,
    required this.spacing4,
    required this.spacing5,
    required this.spacing6,
    required this.spacing7,
  });

  const FDSSpacing.standard()
      : spacing0 = 0.0,
        spacing1 = 4.0,
        spacing2 = 8.0,
        spacing3 = 16.0,
        spacing4 = 24.0,
        spacing5 = 48.0,
        spacing6 = 96.0,
        spacing7 = 192.0;

  final double spacing0;
  final double spacing1;
  final double spacing2;
  final double spacing3;
  final double spacing4;
  final double spacing5;
  final double spacing6;
  final double spacing7;

  @override
  int get hashCode => Object.hash(
        spacing0,
        spacing1,
        spacing2,
        spacing3,
        spacing4,
        spacing5,
        spacing6,
        spacing7,
      );

  @override
  bool operator ==(Object other) =>
      other is FDSSpacing && other.hashCode == hashCode;
}
