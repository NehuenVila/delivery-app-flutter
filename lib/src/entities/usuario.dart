
class Usuario {
  String _id;
  String _name;
  String _image;

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get name => _name;

  String get image => _image;

  set image(String value) {
    _image = value;
  }

  set name(String value) {
    _name = value;
  }
}