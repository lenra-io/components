import 'package:flutter/material.dart';
import 'package:lenra_components/theme/lenra_checkbox_theme_data.dart';
import 'package:lenra_components/theme/lenra_theme.dart';

class LenraCheckbox extends StatelessWidget {
  final String? label;
  final bool value;
  final bool disabled;

  final void Function(bool?)? onChanged;

  const LenraCheckbox({
    Key? key,
    this.label,
    required this.value,
    this.disabled = false,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LenraCheckboxThemeData finalLenraCheckboxThemeData = LenraTheme.of(context).lenraCheckboxThemeData;

    Widget checkbox = Checkbox(
      value: value,
      onChanged: disabled ? null : onChanged ?? (e) => {},
      tristate: true,
    );
    if (label == null) {
      return checkbox;
    }

    return Row(
      children: [
        checkbox,
        Text(
          label!,
          style: finalLenraCheckboxThemeData.getTextStyle(disabled),
        ),
      ],
    );
  }
}
