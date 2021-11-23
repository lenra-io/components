import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lenra_components/component/lenra_toggle.dart';
import 'package:lenra_components/theme/lenra_toggle_syle.dart';

void main() {
  testWidgets('Test Basic LenraToggle', (WidgetTester tester) async {
    var _giveVerse = true;

    LenraToggleStyle style = const LenraToggleStyle(
      activeTrackColor: Colors.black,
      focusColor: Colors.amber,
      inactiveThumbColor: Colors.amber,
      hoverColor: Colors.amber,
      materialTapTargetSize: MaterialTapTargetSize.padded,
    );

    LenraToggle lenraToggle = LenraToggle(
      value: _giveVerse,
      onPressed: null,
      style: style,
      autofocus: true,
      splashRadius: 2,
      dragStartBehavior: DragStartBehavior.down,
    );

    expect(lenraToggle.value, true);
    expect(style.activeTrackColor, Colors.black);
    expect(style.focusColor, Colors.amber);
    expect(lenraToggle.autofocus, true);
    expect(lenraToggle.splashRadius, 2);
    expect(lenraToggle.dragStartBehavior, DragStartBehavior.down);
    expect(style.inactiveThumbColor, Colors.amber);
    expect(style.hoverColor, Colors.amber);
    expect(style.materialTapTargetSize, MaterialTapTargetSize.padded);
    expect(lenraToggle.onPressed, null);
  });

  testWidgets('Test onPressed active', (WidgetTester tester) async {
    var value = false;
    await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          return Material(
              child: LenraToggle(
            key: const Key('myKey'),
            value: value,
            onPressed: (newValue) {
              setState(() {
                value = newValue;
              });
            },
          ));
        })));

    expect(value, false);
    await tester.tap(find.byKey(const Key('myKey')));
    await tester.pump();
    expect(value, true);
  });
}
