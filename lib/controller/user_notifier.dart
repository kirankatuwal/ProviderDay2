import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:providerapp/models/user.dart';

class UserNotifier extends ChangeNotifier {
  List<User> _userlist = [];
  int _age = 0;
  int _height = 0;

  UnmodifiableListView<User> get userlist => UnmodifiableListView(_userlist);

  int get age => _age;
  int get height => _height;

  addUser(User user) {
    _userlist.add(user);
    notifyListeners();
  }

  deleteUser(index) {
    _userlist.removeWhere((_user) => _user.name == _userlist[index].name);
    notifyListeners();
  }

  incrementAge() {
    _age++;
    notifyListeners();
  }

  incrementHeight() {
    _height++;
    notifyListeners();
  }
}
