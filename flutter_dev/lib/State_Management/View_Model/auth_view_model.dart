import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev/State_Management/Repositorie/auth_repos.dart';
import 'package:flutter_dev/State_Management/Utills/Rouute/route_name.dart';
import 'package:flutter_dev/State_Management/Utills/utills.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepos();
  bool _loading = false;
  bool get loading => _loading;

  bool _SignUp_loading = false;
  bool get SignUp_loading => _SignUp_loading;
  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSIgnUploading(bool value) {
    _SignUp_loading = value;
    notifyListeners();
  }

  Future<void> login_api(dynamic data, BuildContext context) async {
    setloading(true);
    _myRepo
        .login_api(data)
        .then((value) {
          setloading(false);
          Utills.flushBarErrorMessages('Login Sucessfully', context);
          Navigator.pushNamed(context, RouteName.home);
          if (kDebugMode) {
            print(value.toString());
          }
        })
        .onError((error, StackTrace) {
          setloading(false);
          Utills.flushBarErrorMessages(error.toString(), context);
          if (kDebugMode) {
            print(error.toString());
          }
        });
  }

  Future<void> SignUp_api(dynamic data, BuildContext context) async {
    setSIgnUploading(true);
    _myRepo.SignUp_api(data)
        .then((value) {
          setloading(false);
          Utills.flushBarErrorMessages('Sign Up Sucessfully', context);
          Navigator.pushNamed(context, RouteName.home);
          if (kDebugMode) {
            print(value.toString());
          }
        })
        .onError((error, StackTrace) {
          setSIgnUploading(false);
          Utills.flushBarErrorMessages(error.toString(), context);
          if (kDebugMode) {
            print(error.toString());
          }
        });
  }
}
