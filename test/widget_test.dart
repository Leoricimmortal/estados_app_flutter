import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'package:estados_app_flutter/main.dart';

void main() {
  testWidgets('Tela principal exibe os cinco estados', (WidgetTester tester) async {
    await tester.pumpWidget(const MeuAplicativo());

    expect(find.text('ESTADOS DO CICLO DE VIDA'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsNWidgets(5));
  });

  testWidgets('Botão HIDDEN abre a tela correta e volta',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MeuAplicativo());

    await tester.tap(find.text('Oculto (HIDDEN)'));
    await tester.pumpAndSettle();
    expect(find.text('HIDDEN'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();
    expect(find.text('ESTADOS DO CICLO DE VIDA'), findsOneWidget);
  });
}
