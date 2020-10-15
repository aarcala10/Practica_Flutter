import 'package:everpobre/domain/notebook.dart';
import 'package:everpobre/domain/notebooks.dart';
import 'package:everpobre/scenes/notes_scene.dart';
import 'package:everpobre/scenes/notebooks_scene.dart';
import 'package:everpobre/texts_resources.dart';
import 'package:flutter/material.dart';
import 'package:everpobre/domain/note.dart';

final Notebook model = Notebook.testDataBuilder();
final Notebooks library = Notebooks.testDataBuilder();
void main() {
  runApp(TreeBuilder());
}

class Message {
  final String body;

  Message(String newValue) : body = newValue;
}

class TreeBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFF388E3C),
        accentColor: Color(0xFFFFC107),
      ),
      title: TextResources.appName,
      routes: {
        NotebooksWidget.routeName: (context) => NotebooksWidget(),
        NotesWidget.routeName: (context) => NotesWidget(),
      },
      initialRoute: NotebooksWidget.routeName,
    );
  }
}

class NotebooksWidget extends StatelessWidget {
  static final routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextResources.appName),
      ),
      body: NotebooksListView(library),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFFC107),
        onPressed: () {
          library.add(Notebook("Nuevo notebook"));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class NotesWidget extends StatelessWidget {
  static final routeName = "/notes";

  @override
  Widget build(BuildContext context) {
    Message msg = ModalRoute.of(context).settings.arguments as Message;

    return Scaffold(
      appBar: AppBar(
        title: Text(msg.body),
      ),
      body: NotesListView(model),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFFC107),
        onPressed: () {
          model.add(Note("Una nueva nota"));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
