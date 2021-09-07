class Usr {
  String? _fName, _lName, _email, _phoneNumber;
  Usr(String fName, String lName, String email, String phoneNumber) {
    this._fName = fName;
    this._lName = lName;
    this._email = email;
    this._phoneNumber = phoneNumber;
  }

  set firstName(String name) {
    this._fName = name;
  }

  void set lastName(String name) {
    this._lName = name;
  }

  set userEmail(String email) {
    this._email = email;
  }

  set userPhoneNumber(String number) {
    this._phoneNumber = number;
  }

  String get firstName => this._fName!;
  String get lastName => this._lName!;
  String get userEmail => this._email!;
  String get userPhoneNumber => this._phoneNumber!;
}
