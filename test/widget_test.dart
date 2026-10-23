import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_2/main.dart';

void main() {
  testWidgets('Добавление и удаление заметки', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Список пуст'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Первая заметка');
    await tester.tap(find.text('Сохранить'));
    await tester.pump();

    expect(find.text('Первая заметка'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Вторая заметка');
    await tester.tap(find.text('Сохранить'));
    await tester.pump();

    expect(find.text('Вторая заметка'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.delete).first);
    await tester.pump();

    expect(find.text('Вторая заметка'), findsNothing);
    expect(find.text('Первая заметка'), findsOneWidget);
  });

  testWidgets('Редактирование заметки', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(find.byType(TextField), 'Текст');
    await tester.tap(find.text('Сохранить'));
    await tester.pump();

    await tester.tap(find.byIcon(Icons.edit));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).last, 'Новый текст');
    await tester.tap(find.text('Сохранить').last);
    await tester.pumpAndSettle();

    expect(find.text('Новый текст'), findsOneWidget);
    expect(find.text('Текст'), findsNothing);
  });
}
