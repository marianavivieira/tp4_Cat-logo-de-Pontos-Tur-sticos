
import 'package:flutter_test/flutter_test.dart';
import 'package:catalogo_turistico/main.dart';

void main() {
  testWidgets('Aplicativo inicia corretamente', (WidgetTester tester) async {
    await tester.pumpWidget(const Principal());

    expect(
      find.text('Mariana Vieira'),
      findsOneWidget,
    );

    expect(
      find.text('Descubra a Baixada Santista!'),
      findsOneWidget,
    );
  });
}
