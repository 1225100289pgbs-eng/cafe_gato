import 'package:flutter_test/flutter_test.dart';
import 'package:gato_cafe/main.dart';

void main() {
  testWidgets('Splash pasa al Home a los 3 segundos', (WidgetTester tester) async {
    await tester.pumpWidget(const GatoCafeApp());

    // Estamos en el splash
    expect(find.text('Miau Café'), findsOneWidget);

    // Esperamos los 3 segundos y la transición
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    // Ahora estamos en el Home
    expect(find.text('Miau Café 🐾'), findsOneWidget);
    expect(find.text('Mochi'), findsOneWidget);
  });
}