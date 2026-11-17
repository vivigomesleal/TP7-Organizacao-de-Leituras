

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tp7_leituras_basico/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('Verifica a tela inicial do aplicativo',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MeuAplicativo());
    await tester.pumpAndSettle();

    expect(find.text('Minha Estante'), findsOneWidget);
    expect(find.text('Nenhum livro cadastrado.'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });

  testWidgets('Verifica a tela de cadastro de livros',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MeuAplicativo());
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    expect(find.text('Cadastrar Livro'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(DropdownButton<String>), findsOneWidget);
    expect(find.text('Salvar Livro'), findsOneWidget);
  });

  testWidgets('Verifica o cadastro de um livro',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MeuAplicativo());
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byType(TextField).at(0),
      'Dom Casmurro',
    );

    await tester.enterText(
      find.byType(TextField).at(1),
      'Machado de Assis',
    );

    await tester.tap(find.text('Salvar Livro'));
    await tester.pumpAndSettle();

    expect(find.text('Dom Casmurro'), findsOneWidget);
    expect(find.textContaining('Machado de Assis'), findsOneWidget);
    expect(find.textContaining('Quero ler'), findsOneWidget);
  });
}
