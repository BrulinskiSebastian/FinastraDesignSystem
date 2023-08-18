import 'package:flutter/widgets.dart';

import '../finastra_design_system.dart';

@immutable
class FDSTheme extends InheritedWidget {
  const FDSTheme({
    required this.themeData,
    required super.child,
    super.key,
  });

  final FDSThemeData themeData;

  static FDSThemeData of(BuildContext context) {
    final fdsTheme = context.dependOnInheritedWidgetOfExactType<FDSTheme>();
    assert(fdsTheme != null, 'Cannot find FDSTheme in given context');
    return fdsTheme!.themeData;
  }

  @override
  bool updateShouldNotify(FDSTheme oldWidget) {
    return oldWidget.themeData != themeData;
  }
}

@immutable
class FDSThemeData {
  FDSThemeData({
    this.colorScheme = const FDSColorScheme.light(),
    this.spacing = const FDSSpacing.standard(),
  }) : elevation = FDSElevation(colorScheme.onSurface);

  final FDSColorScheme colorScheme;
  final FDSSpacing spacing;
  final FDSElevation elevation;

  @override
  int get hashCode => Object.hash(colorScheme, spacing);

  @override
  bool operator ==(Object other) =>
      other is FDSThemeData && other.hashCode == hashCode;
}

extension FDSThemeExt on BuildContext {
  FDSThemeData get theme => FDSTheme.of(this);
}
