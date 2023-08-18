import 'package:finastra_design_system/finastra_design_system.dart';
import 'package:flutter/widgets.dart';

class FDSElevation {
  const FDSElevation(this.color);

  final FDSColor color;

  List<BoxShadow> get e00 => const [];

  List<BoxShadow> get e01 => [
        BoxShadow(
          color: color.toColor().withOpacity(0.11),
          blurRadius: 1.0,
          offset: const Offset(0.0, 1.0),
        ),
        BoxShadow(
          color: color.toColor().withOpacity(0.09),
          blurRadius: 1.0,
          offset: const Offset(0.0, 2.0),
        ),
        BoxShadow(
          color: color.toColor().withOpacity(0.16),
          blurRadius: 3.0,
          offset: const Offset(0.0, 1.0),
        ),
      ];

  List<BoxShadow> get e02 => [
        BoxShadow(
          color: color.toColor().withOpacity(0.11),
          blurRadius: 2.0,
          offset: const Offset(0.0, 2.0),
        ),
        BoxShadow(
          color: color.toColor().withOpacity(0.09),
          blurRadius: 1.0,
          offset: const Offset(0.0, 3.0),
        ),
        BoxShadow(
          color: color.toColor().withOpacity(0.16),
          blurRadius: 5.0,
          offset: const Offset(0.0, 1.0),
        ),
      ];

  List<BoxShadow> get e03 => [
        BoxShadow(
          color: color.toColor().withOpacity(0.11),
          blurRadius: 4.0,
          offset: const Offset(0.0, 3.0),
        ),
        BoxShadow(
          color: color.toColor().withOpacity(0.09),
          blurRadius: 3.0,
          offset: const Offset(0.0, 3.0),
        ),
        BoxShadow(
          color: color.toColor().withOpacity(0.16),
          blurRadius: 8.0,
          offset: const Offset(0.0, 1.0),
        ),
      ];

  List<BoxShadow> get e04 => [
        BoxShadow(
          color: color.toColor().withOpacity(0.11),
          blurRadius: 5.0,
          offset: const Offset(0.0, 4.0),
        ),
        BoxShadow(
          color: color.toColor().withOpacity(0.09),
          blurRadius: 10.0,
          offset: const Offset(0.0, 1.0),
        ),
        BoxShadow(
          color: color.toColor().withOpacity(0.16),
          blurRadius: 4.0,
          offset: const Offset(0.0, 2.0),
        ),
      ];

  List<BoxShadow> get e06 => [
        BoxShadow(
          color: color.toColor().withOpacity(0.11),
          blurRadius: 10.0,
          offset: const Offset(0.0, 6.0),
        ),
        BoxShadow(
          color: color.toColor().withOpacity(0.09),
          blurRadius: 18.0,
          offset: const Offset(0.0, 1.0),
        ),
        BoxShadow(
          color: color.toColor().withOpacity(0.16),
          blurRadius: 5.0,
          offset: const Offset(0.0, 3.0),
        ),
      ];

  List<BoxShadow> get e08 => [
        BoxShadow(
          color: color.toColor().withOpacity(0.11),
          blurRadius: 10.0,
          offset: const Offset(0.0, 8.0),
        ),
        BoxShadow(
          color: color.toColor().withOpacity(0.09),
          blurRadius: 14.0,
          offset: const Offset(0.0, 3.0),
        ),
        BoxShadow(
          color: color.toColor().withOpacity(0.16),
          blurRadius: 5.0,
          offset: const Offset(0.0, 5.0),
        ),
      ];

  List<BoxShadow> get e09 => [
        BoxShadow(
          color: color.toColor().withOpacity(0.11),
          blurRadius: 12.0,
          offset: const Offset(0.0, 9.0),
        ),
        BoxShadow(
          color: color.toColor().withOpacity(0.09),
          blurRadius: 16.0,
          offset: const Offset(0.0, 3.0),
        ),
        BoxShadow(
          color: color.toColor().withOpacity(0.16),
          blurRadius: 5.0,
          offset: const Offset(0.0, 5.0),
        ),
      ];

  List<BoxShadow> get e12 => [
        BoxShadow(
          color: color.toColor().withOpacity(0.11),
          blurRadius: 17.0,
          offset: const Offset(0.0, 12.0),
        ),
        BoxShadow(
          color: color.toColor().withOpacity(0.09),
          blurRadius: 22.0,
          offset: const Offset(0.0, 5.0),
        ),
        BoxShadow(
          color: color.toColor().withOpacity(0.16),
          blurRadius: 8.0,
          offset: const Offset(0.0, 7.0),
        ),
      ];

  List<BoxShadow> get e16 => [
        BoxShadow(
          color: color.toColor().withOpacity(0.11),
          blurRadius: 24.0,
          offset: const Offset(0.0, 16.0),
        ),
        BoxShadow(
          color: color.toColor().withOpacity(0.09),
          blurRadius: 30.0,
          offset: const Offset(0.0, 6.0),
        ),
        BoxShadow(
          color: color.toColor().withOpacity(0.16),
          blurRadius: 10.0,
          offset: const Offset(0.0, 8.0),
        ),
      ];

  List<BoxShadow> get e24 => [
        BoxShadow(
          color: color.toColor().withOpacity(0.11),
          blurRadius: 38.0,
          offset: const Offset(0.0, 24.0),
        ),
        BoxShadow(
          color: color.toColor().withOpacity(0.09),
          blurRadius: 46.0,
          offset: const Offset(0.0, 9.0),
        ),
        BoxShadow(
          color: color.toColor().withOpacity(0.16),
          blurRadius: 15.0,
          offset: const Offset(0.0, 11.0),
        ),
      ];

  @override
  int get hashCode => color.hashCode;

  @override
  bool operator ==(Object other) =>
      other is FDSElevation && other.hashCode == hashCode;
}
