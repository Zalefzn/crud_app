import 'package:find_content_app/api/userApi.dart';
import 'package:find_content_app/model/userModel.dart';
import 'package:flutter/material.dart';

//provider table management
class UserProviders with ChangeNotifier {
  late UserModel user;

  List<UserModel> _user = [];
  List<UserModel> get users => _user;
  set users(List<UserModel> users) {
    notifyListeners();
  }

  UserById(UserModel user) async {
    var dataUser = user.id;
  }

  Future<void> getUsers() async {
    try {
      List<UserModel> users = await UserService().getUser();

      _user = users;
    } catch (e) {
      print(e);
    }
  }
}
