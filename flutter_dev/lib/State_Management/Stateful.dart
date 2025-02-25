// ignore_for_file: camel_case_types, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class state_ful extends StatefulWidget {
  const state_ful({Key? key}) : super(key: key);

  @override
  State<state_ful> createState() => _state_fulState();
}

class _state_fulState extends State<state_ful> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Stateful state provider'))),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text(DateTime.now().toString(),style: TextStyle(color: const Color.fromARGB(218, 0, 0, 0)),)),
          Center(
            child: Text(
              count.toString(),
              style: TextStyle(fontSize: 50.sp, color: Colors.black),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 161, 213, 201),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        onPressed: () {
          setState(() {
            count++;
          });
          print(count);
        },
        child: Icon(Icons.add, size: 30.sp),
      ),
    );
  }
}
