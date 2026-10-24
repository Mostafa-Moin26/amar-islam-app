import 'package:amar_islam/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('app starts and shows the app name', (tester) async {
    await tester.pumpWidget(const AmarIslamApp());

    expect(find.text('আমার ইসলাম'), findsWidgets);
  });
}
