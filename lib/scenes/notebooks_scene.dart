import 'package:everpobre/domain/notebooks.dart';
import 'package:everpobre/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotebooksListView extends StatefulWidget {
  final Notebooks _model;

  const NotebooksListView(Notebooks model) : _model = model;

  @override
  _NotebooksListViewState createState() => _NotebooksListViewState();
}

class _NotebooksListViewState extends State<NotebooksListView> {
  void modelDidChange() {
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    widget._model.addListener(modelDidChange);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    widget._model.removeListener(modelDidChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget._model.length,
      itemBuilder: (context, index) {
        return NotebookSilver(widget._model, index);
      },
    );
  }
}

class NotebookSilver extends StatefulWidget {
  final Notebooks notebooks;
  final int index;

  const NotebookSilver(Notebooks notebooks, int index)
      : this.notebooks = notebooks,
        this.index = index;

  @override
  _NotebookSilverState createState() => _NotebookSilverState();
}

class _NotebookSilverState extends State<NotebookSilver> {
  @override
  Widget build(BuildContext context) {
    DateFormat fmt = DateFormat("yyyy-MM-dd");

    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        widget.notebooks.removeAt(widget.index);
        setState(() {});
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Element ${widget.index} has been deleted"),
          backgroundColor: Colors.grey[700],
          duration: const Duration(seconds: 2),
        ));
      },
      background: Container(
        color: Colors.red,
      ),
      child: Card(
        color: Colors.grey[200],
        child: ListTile(
          onTap: () {
            Navigator.pushNamed(context, NotesWidget.routeName,
                arguments: Message(widget.notebooks[widget.index].title));
            print(widget.notebooks[widget.index].title);
          },
          leading: const Icon(Icons.library_books),
          title: Text(widget.notebooks[widget.index].title),
        ),
      ),
    );
  }
}
