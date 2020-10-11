import 'package:everpobre/extensions/date_time.dart';

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
  @override
  String toString() {
    return "<$runtimeType: $body>";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    } else {
      return other is Note &&
          other.body == body &&
          other.creationDate.almostEqual(_creationDate);
    }
  }

  @override
  int get hashCode {
    final proxy = DateTime(
        _creationDate.year,
        _creationDate.month,
        _creationDate.day,
        _creationDate.hour,
        _creationDate.minute,
        _creationDate.second);
    return proxy.hashCode;
  }
}
