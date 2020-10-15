import 'package:everpobre/domain/notebook.dart';
import 'package:flutter/material.dart';

class Notebooks with ChangeNotifier {
  static final shared = Notebooks();

  final List<Notebook> _notebooks = [];

  int get length => _notebooks.length;

  Notebooks();
  Notebooks.testDataBuilder() {
    _notebooks
        .addAll(List.generate(25, (index) => Notebook("Notebook $index")));
  }

  Notebook operator [](int index) {
    return _notebooks[index];
  }

  bool remove(Notebook notebook) {
    final n = _notebooks.remove(notebook);
    notifyListeners();
    return n;
  }

  Notebook removeAt(int index) {
    final n = _notebooks.removeAt(index);
    notifyListeners();
    return n;
  }

  void add(Notebook note) {
    _notebooks.insert(0, note);
    notifyListeners();
  }

  @override
  String toString() {
    return "<runtimeType: $length notes>";
  }
}
