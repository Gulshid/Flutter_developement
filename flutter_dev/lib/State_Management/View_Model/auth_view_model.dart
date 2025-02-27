import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev/State_Management/Repositorie/auth_repos.dart';
import 'package:flutter_dev/State_Management/Utills/utills.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepos();
  Future<void> login_api(dynamic data, BuildContext context) async {
    _myRepo
        .login_api(data)
        .then((value) {
          if (kDebugMode) {
            print(value.toString());
          }
        })
        .onError((error, StackTrace) {
          if (kDebugMode) {
            Utills.flushBarErrorMessages(error.toString(), context);
            print(error.toString());
          }
        });
  }
}
