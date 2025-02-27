import 'package:flutter/material.dart';
// import 'package:flutter_dev/State_Management/Utills/Rouute/route_name.dart';
import 'package:flutter_dev/State_Management/Utills/utills.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: InkWell(
        onTap: () {
          Utills.toastMessage('You tapped me');
          // Utills.flushBarErrorMessages('Hello', context);
          Utills.snakbar('Hello World', context);
        },
        child: Center(
          child: Text(
            'CLick',
            style: TextStyle(color: Colors.black, fontSize: 50.sp),
          ),
        ),
      ),
    );
  }
}
