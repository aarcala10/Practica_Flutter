import 'package:everpobre/domain/notebook.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotesListView extends StatefulWidget {
  final Notebook _model;

  const NotesListView(Notebook model) : _model = model;

  @override
  _NotesListViewState createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
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
        return NoteSilver(widget._model, index);
      },
    );
  }
}

class NoteSilver extends StatefulWidget {
  final Notebook notebook;
  final int index;

  const NoteSilver(Notebook notebook, int index)
      : this.notebook = notebook,
        this.index = index;

  @override
  _NoteSilverState createState() => _NoteSilverState();
}

class _NoteSilverState extends State<NoteSilver> {
  @override
  Widget build(BuildContext context) {
    DateFormat fmt = DateFormat("yyyy-MM-dd");

    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        widget.notebook.removeAt(widget.index);
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
          leading: const Icon(Icons.toc),
          title: Text(widget.notebook[widget.index].body),
          subtitle:
              Text(fmt.format(widget.notebook[widget.index].modificationDate)),
        ),
      ),
    );
  }
}
