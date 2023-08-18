import 'package:finastra_design_system/finastra_design_system.dart';

class FDSButtonToggleItem<T> {
  FDSButtonToggleItem({this.value, this.icon, this.text, this.badge})
      : assert(icon != null || text != null, '');

  final T? value;
  final SvgGenImage? icon;
  final String? text;
  final FDSBadge? badge;
}
