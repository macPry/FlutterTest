// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter_app/api/Post.dart';
import 'package:flutter_app/api/postApi.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_app/main.dart';

var mockedPostApi = MockPostApi();

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    when(mockedPostApi.getPost(123)).thenReturn(Post(id: 123, title: 'Aaa', body: 'Boo'));

    await tester.pumpWidget(MyApp(mockedPostApi));

    verify(mockedPostApi.getPost(123));

    // Verify that our counter starts at 0.
    expect(find.text('Aaa'), findsOneWidget);
    expect(find.text('1'), findsNothing);

  });
}
