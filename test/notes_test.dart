import 'package:flutter_test/flutter_test.dart';
import 'package:everpobre/model/note.dart';

void main() {
  group("construction", () {
    // Aquí los test
    test("Can create notes", () {
      expect(Note("a new note"), isNotNull);
      expect(Note.empty().body, "");
    });
  });

  group("dates", () {
    test("Modificación is bigger than creation after modification", () {
      var n1 = Note.empty();
      n1.body = "Test nuevo";

      expect(n1.creationDate.isBefore(n1.modificationDate), isTrue);
    });
  });

  group("Object Protocol", () {
    test("equality", () {
      var n = Note("Mi nota");
      expect(n, n);
      expect(n, Note("Mi nota"));
      expect(n != Note.empty(), isTrue);
    });

    test("hashCode", () {
      var n1 = Note("Mi nota");
      var n2 = Note("Mi nota");

      expect(n1.hashCode, n2.hashCode);
    });
  });
}
