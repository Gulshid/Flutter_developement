import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class p2 extends StatefulWidget {
  const p2({super.key});

  @override
  State<p2> createState() => _p2State();
}

class _p2State extends State<p2> {
  int count = 0;
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      count++;
      print(count);
      setState(() {
      
    });
    });
    
  }

  Widget build(BuildContext context) {
    print('build' + count.toString());
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'dis advan of stateful widget',
            style: TextStyle(color: Colors.white),
          ),
        ),
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              count.toString(),
              style: TextStyle(color: Colors.black, fontSize: 40.sp),
            ),
          ),
        SizedBox(height: 20.sp,),
          Center(
            child: Container(
              height: 100.h,
              width: 200.w,
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent[100],
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Text(
                  DateTime.now().hour.toString()+':'+DateTime.now().minute.toString()+':'+DateTime.now().second.toString()+':'+DateTime.now().millisecond.toString(),
                  style: TextStyle(color: Colors.black, fontSize: 40.sp),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
