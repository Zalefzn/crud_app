import 'dart:convert';
import 'package:find_content_app/model/userModel.dart';
import 'package:http/http.dart' as http;

//api tableService
class UserService {
  Future<List<UserModel>> getUser() async {
    var url = 'https://dummyapi.io/data/v1/user';
    var headers = {
      'app-id': '62bd70e0f59e70eac0ec8adb',
      'Authorization': 'Bearer 62bd70e0f59e70eac0ec8adb',
      'Content-Type': 'application/json',
    };

    var response = await http.get(Uri.parse(url), headers: headers);
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];

      List<UserModel> users = [];

      for (var item in data) {
        users.add(UserModel.fromJson(item));
      }
      return users;
    } else {
      throw Exception('Gagal Get Users');
    }
  }

//   Future<List<UserModel>> postUser() async {
//     var url = 'https://dummyapi.io/data/v1/user/create';
//     var headers = {
//       'app-id': '62bd70e0f59e70eac0ec8adb',
//       'Authorization': 'Bearer 62bd70e0f59e70eac0ec8adb',
//       'Content-Type': 'application/json',
//     };

//     var queryUser = jsonEncode({
//       'firstName':
//       'lastName':
//       'email':
//     });
//   }
// }
}
