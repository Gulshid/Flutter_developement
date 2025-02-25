import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class statless extends StatelessWidget {
  statless({Key? key}) : super(key: key);

  int value = 46;

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Stateless state Provider'))),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "$value",
              style: TextStyle(fontSize: 40.sp, color: Colors.black),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),
        onPressed: () {
          value++;
          print(value);
        },

        child: Icon(Icons.add, size: 25.sp),
      ),
    );
  }
}
