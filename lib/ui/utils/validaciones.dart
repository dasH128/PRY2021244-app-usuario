bool isNumeric(String value) {
  if (value.isEmpty) return false;

  final n = num.tryParse(value);

  return (n == null) ? false : true;
}

bool isText(String value) {
  if (value.isEmpty) return false;

  final n = num.tryParse(value);

  return (n == null) ? true : false;
}

bool isEmail(String email) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(pattern);
  if (regExp.hasMatch(email)) {
    return true;
  } else {
    return false;
  }
}

bool isNane(String texto) {
  String pattern = r"^[a-z ,.'-]+$";
  RegExp regExp = RegExp(pattern);
  if (regExp.hasMatch(texto)) {
    return true;
  } else {
    return false;
  }
}
