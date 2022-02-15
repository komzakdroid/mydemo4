class DataModel {
  var _text;
  var _number;

  DataModel(this._text, this._number);

  DataModel.empty();

  get number => _number;

  set number(value) {
    _number = value;
  }

  get text => _text;

  set text(value) {
    _text = value;
  }

  @override
  String toString() {
    return 'DataModel{_text: $_text, _number: $_number}';
  }
}
