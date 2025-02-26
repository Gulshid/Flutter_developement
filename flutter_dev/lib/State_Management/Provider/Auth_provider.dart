import 'package:flutter/material.dart';
import 'package:http/http.dart';

class auth_provider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  set_loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  //login function for post api
  void login(String email, String password) async {
    set_loading(true);
    try {
      Response response = await post(
        Uri.parse('https://reqres.in/api/login'),
        body: {"email": email, "password": password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Successfully login');
        set_loading(false);

      } else {
        set_loading(false);
        print('Failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
