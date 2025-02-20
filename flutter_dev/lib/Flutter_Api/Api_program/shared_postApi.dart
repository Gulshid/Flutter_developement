// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class shared_login extends StatefulWidget {
  const shared_login({super.key});

  @override
  State<shared_login> createState() => _shared_loginState();
}

class _shared_loginState extends State<shared_login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Function to log in and store data in shared preferences
  Future<void> logIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      final url = Uri.parse('apiLoginUrl');
      final headers = {
        'Content-Type': 'application/json',
      };
      final requestBody = {
        'email': email,
        'password': password,
      };
      print('request body ----> ${requestBody.toString()}');
      Response response =
          await post(url, headers: headers, body: json.encode(requestBody));
      print('response before status code ---- > ${response.body.toString()}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body.toString());

        SharedPreferences sp = await SharedPreferences.getInstance();
        String id = '${data['id']}';
        String token = '${data['token']}';
        print('id stored in shared preferences ---- ${id.toString()}');
        print('token stored in shared preferences ---- ${token.toString()}');
        sp.setString('id', id);
        sp.setString('token', token);

        print("Response status: ${data['status']}");
        print("Response message: ${data['msg']}");
        print("Response id: ${data['id']}");
        print("Response token: ${data['token']}");
      } else {
        print("Error ----> ${response.body}");
      }
    } catch (e) {
      print('error----------> $e');
    }
  }

  // Function to get data from shared preferences
  Future<void> getDataFromSharedPreferences() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? id = sp.getString('id');
    String? token = sp.getString('token');
    print('Retrieved id from shared preferences: $id');
    print('Retrieved token from shared preferences: $token');
  }

  // Function to delete data from shared preferences
  Future<void> deleteDataFromSharedPreferences() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.remove('id');
    await sp.remove('token');
    print('Deleted id and token from shared preferences');
  }

  // Function to delete data using an API
  Future<void> deleteDataUsingApi({
    required BuildContext context,
    required String id,
    required String token,
  }) async {
    try {
      final url = Uri.parse('apiDeleteUrl');
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      final requestBody = {
        'id': id,
      };
      print('request body for delete ----> ${requestBody.toString()}');
      Response response = await delete(url, headers: headers, body: json.encode(requestBody));
      print('response before status code ---- > ${response.body.toString()}');
      if (response.statusCode == 200 || response.statusCode == 204) {
        print("Data deleted successfully");
      } else {
        print("Error ----> ${response.body}");
      }
    } catch (e) {
      print('error----------> $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal,
        title: const Text(
          'Login Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8)),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'enter your email',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8)),
                child: TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                      hintText: 'enter your password',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 5)),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextButton(
                    onPressed: () async {
                      print('email ---> ${emailController.text}');
                      print('password ---> ${passwordController.text}');
                      await logIn(
                          context: context,
                          email: emailController.text,
                          password: passwordController.text);
                      await getDataFromSharedPreferences();
                      await deleteDataUsingApi(
                          context: context,
                          id: 'your_id_here',
                          token: 'your_token_here');
                      await deleteDataFromSharedPreferences();
           
                    },
                    child: const Text(
                      'POST',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}