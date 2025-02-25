import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class State_ful_disadvan extends StatefulWidget {
  const State_ful_disadvan({Key? key}) : super(key: key);

  @override
  State<State_ful_disadvan> createState() => _State_ful_disadvanState();
}

class _State_ful_disadvanState extends State<State_ful_disadvan> {
  int incre_count = 0;
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (timer) {
      //  incre_count++;
      //   print(incre_count);
      setState(() {
       
      });
    });
  }

  Widget build(BuildContext context) {
    print('build:'+incre_count.toString());
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('DiaAdvantage of stateful widget'))),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
              //this stateful widget will occupy to many RAM memory and can be hing you are app also this why 
              //we use state management to avoid this kind of problem
          Center(
            child: Text(
              DateTime.now().hour.toString()+':'+ DateTime.now().minute.toString()+':'+ DateTime.now().second.toString(),
              style: TextStyle(fontSize: 50.sp, color: Colors.black),
            ),
          ),
          Center(
            child: Text(
              incre_count.toString(),
              style: TextStyle(fontSize: 50.sp, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
