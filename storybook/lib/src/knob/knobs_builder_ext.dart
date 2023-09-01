import 'package:finastra_design_system/finastra_design_system.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

extension KnobsBuilderExt on KnobsBuilder {
  SvgGenImage? icon({required String label}) => options(
        label: label,
        initial: null,
        options: [
          const Option(label: '-', value: null),
          ...FDSAsset.icon.values.map(
            (i) => Option(
                label: i.path.split('/').last.split('.').first, value: i),
          ),
        ],
      );
}
