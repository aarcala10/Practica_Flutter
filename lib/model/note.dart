class Note {
  String _body = "";

  String get body => _body;
  set body(String newValue) {
    _body = newValue;
    _modificationDate = DateTime.now();
  }

  DateTime _creationDate;
  DateTime get creationDate => _creationDate;
  DateTime _modificationDate;
  DateTime get modificationDate => _modificationDate;

  //Constructor
  Note(String contents) : _body = contents {
    _creationDate = DateTime.now();
    _modificationDate = DateTime.now();
  }
  Note.empty() : this("");

  //Métodos heredados de Object

}
