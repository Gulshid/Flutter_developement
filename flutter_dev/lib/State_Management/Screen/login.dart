import 'package:flutter/material.dart';
import 'package:flutter_dev/State_Management/Provider/Auth_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController email_Controller = TextEditingController();
  TextEditingController password_Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Auth_provider = Provider.of<auth_provider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('login', style: TextStyle(color: Colors.white)),
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'login',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              controller: email_Controller,
              style: TextStyle(color: Colors.black),
              enabled: true,
              decoration: InputDecoration(
                labelText: 'Enter Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
            ),
          ),

          SizedBox(height: 12.h),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              controller: password_Controller,
              style: TextStyle(color: Colors.black),
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Enter Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
            ),
          ),

          SizedBox(height: 10.h),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onTap: () {
                Auth_provider.login(
                  email_Controller.text.toString(),
                  password_Controller.text.toString(),
                );
              },
              child: Container(
                height: 50.h,

                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(12.r),
                ),

                child: Center(
                  child: Auth_provider.loading?CircularProgressIndicator(color: Colors.white,):
                  Text('login Now',style: TextStyle(color: Colors.white,fontSize: 30.sp,fontWeight: FontWeight.bold),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
