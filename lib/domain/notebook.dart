import 'package:everpobre/domain/note.dart';

class Notebook {
  static final shared = Notebook();

  final List<Note> _notes = [];

  int get length => _notes.length;

  Notebook();
  Notebook.testDataBuilder() {
    _notes.addAll(List.generate(50, (index) => Note("Item $index")));
  }

  Note operator [](int index) {
    return _notes[index];
  }

  bool remove(Note note) {
    return _notes.remove(note);
  }

  Note removeAt(int index) {
    return _notes.removeAt(index);
  }

  void add(Note note) {
    _notes.insert(0, note);
  }

  @override
  String toString() {
    return "<runtimeType: $length notes>";
  }
}
