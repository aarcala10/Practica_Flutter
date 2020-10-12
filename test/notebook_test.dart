import 'package:flutter_test/flutter_test.dart';
import 'package:everpobre/domain/notebook.dart';
import 'package:everpobre/domain/note.dart';

void main() {
  group("contruction", () {
    test("Can access the shared notebook singleton", () {
      expect(Notebook.shared, isNotNull);
    });
  });

  group("contents", () {
    test("length behaves correctly", () {
      final nb = Notebook();
      final nb2 = Notebook();
      final n = Note("Lorem Ipsum");

      expect(nb.length, 0);

      nb2.add(n);
      expect(nb2.length, 1);

      nb2.remove(n);
      expect(nb2.length, 0);
    });
  });
}
