import 'package:flutter/cupertino.dart';

class Userss {
  String name, address, id;
  Userss({this.name, this.address, this.id});
}

class UserProvider with ChangeNotifier {
  Map<String, Userss> _users = {};
 Map<String, Userss> get userr {
    return {..._users};
  }

  void addUser(String name, String address, String userId) {
    _users.putIfAbsent(
      userId,
      () => Userss(address: address, id: userId, name: name),
    );
  }

  notifyListeners();
}
