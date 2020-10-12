import 'package:everpobre/domain/notebook.dart';
import 'package:flutter/material.dart';

class NotesListView extends StatelessWidget {
  final Notebook _model;

  const NotesListView(Notebook model) : _model = model;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _model.length,
      itemBuilder: (context, index) {
        return Text(_model[index].body);
      },
    );
  }
}
