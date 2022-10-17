class Users {
  static final Users _users = Users._internal();

  factory Users() {
    return _users;
  }

  Users._internal();

  List<Map<String, dynamic>> users = [];
}
