import 'package:flutter_test/flutter_test.dart';

void main() {
  group("contruction", () {
    test("Can access the shared notebook singleton", () {
      expect(Notebook.shared, isNotNull);
    });
  });
}
