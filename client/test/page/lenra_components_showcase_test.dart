import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fr_lenra_client/components/page/lenra_components_showcase.dart';
import 'package:fr_lenra_client/lenra_components/theme/lenra_theme.dart';
import 'package:fr_lenra_client/lenra_components/theme/lenra_theme_data.dart';
import 'package:fr_lenra_client/redux/states/app_state.dart';
import 'package:redux/redux.dart';

import '../redux/fake_store.dart';

void main() {
  testWidgets('expect LenraComponentsShowcase to build correctly', (WidgetTester tester) async {
    Store<AppState> store = createFakeStore();
    await tester.pumpWidget(MaterialApp(
      home: StoreProvider<AppState>(
        store: store,
        child: LenraTheme(
          themeData: LenraThemeData(),
          child: LenraComponentsShowcase(),
        ),
      ),
    ));
    final finder = find.byType(LenraComponentsShowcase);
    expect(finder, findsOneWidget);
  });
}
