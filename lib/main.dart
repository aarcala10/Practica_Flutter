import 'package:everpobre/domain/notebook.dart';
import 'package:everpobre/scenes/notes_scene.dart';
import 'package:everpobre/texts_resources.dart';
import 'package:flutter/material.dart';
import 'package:everpobre/domain/note.dart';

final Notebook model = Notebook.testDataBuilder();
void main() {
  runApp(TreeBuilder());
}

class TreeBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TextResources.appName,
      home: Scaffold(
        appBar: AppBar(
          title: Text(TextResources.appName),
        ),
        body: NotesListView(model),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            model.add(Note("Una nueva nota"));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
