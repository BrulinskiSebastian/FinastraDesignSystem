import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'color.dart';

@immutable
class FDSColorScheme {
  const FDSColorScheme({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.surface,
    required this.surfaceDisabled,
    required this.success,
    required this.error,
    required this.onPrimary,
    required this.onSecondary,
    required this.onBackground,
    required this.onSurface,
    required this.onSurfaceDisabled,
    required this.onError,
    required this.outlineBorderOnSurface,
  });

  const FDSColorScheme.light()
      : primary = const FDSColor(0xFF694ED6),
        secondary = const FDSColor(0xFFC137A2),
        background = const FDSColor(0xFFFAFAFA),
        surface = const FDSColor(0xFFFFFFFF),
        surfaceDisabled = const FDSColor(0x1F000000),
        success = const FDSColor(0xFF008744),
        error = const FDSColor(0xFFD60040),
        onPrimary = const FDSColor(0xFFFFFFFF),
        onSecondary = const FDSColor(0xFFFFFFFF),
        onBackground = const FDSColor(0xFF000000),
        onSurface = const FDSColor(0xFF000000),
        onSurfaceDisabled = const FDSColor(0x4A000000),
        onError = const FDSColor(0xFFFFFFFF),
        outlineBorderOnSurface = const FDSColor(0x1F000000);

  const FDSColorScheme.dark()
      : primary = const FDSColor(0xFFAFA0E2),
        secondary = const FDSColor(0xFFE453BF),
        background = const FDSColor(0xFF191919),
        surface = const FDSColor(0xFF242424),
        surfaceDisabled = const FDSColor(0x1F242424),
        success = const FDSColor(0xFF26D07C),
        error = const FDSColor(0xFFFF4F5C),
        onPrimary = const FDSColor(0xFF000000),
        onSecondary = const FDSColor(0xFF000000),
        onBackground = const FDSColor(0xFFFFFFFF),
        onSurface = const FDSColor(0xFFFFFFFF),
        onSurfaceDisabled = const FDSColor(0x4A000000),
        onError = const FDSColor(0xFF000000),
        outlineBorderOnSurface = const FDSColor(0x1F000000);

  final FDSColor primary;
  final FDSColor secondary;
  final FDSColor background;
  final FDSColor surface;
  final FDSColor surfaceDisabled;
  final FDSColor success;
  final FDSColor error;
  final FDSColor onPrimary;
  final FDSColor onSecondary;
  final FDSColor onBackground;
  final FDSColor onSurface;
  final FDSColor onSurfaceDisabled;
  final FDSColor onError;
  final FDSColor outlineBorderOnSurface;

  @override
  int get hashCode => Object.hash(
        primary,
        secondary,
        background,
        surface,
        surfaceDisabled,
        success,
        error,
        onPrimary,
        onSecondary,
        onBackground,
        onSurface,
        onSurfaceDisabled,
        onError,
        outlineBorderOnSurface,
      );

  @override
  bool operator ==(Object other) =>
      other is FDSColorScheme && other.hashCode == hashCode;
}
