import 'package:everpobre/domain/note.dart';
import 'package:flutter/material.dart';

class Notebook with ChangeNotifier {
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
    final n = _notes.remove(note);
    notifyListeners();
    return n;
  }

  Note removeAt(int index) {
    final n = _notes.removeAt(index);
    notifyListeners();
    return n;
  }

  void add(Note note) {
    _notes.insert(0, note);
    notifyListeners();
  }

  @override
  String toString() {
    return "<runtimeType: $length notes>";
  }
}
