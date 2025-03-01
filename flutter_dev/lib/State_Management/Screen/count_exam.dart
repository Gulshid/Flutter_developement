import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dev/State_Management/Provider/count_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Counter_Example extends StatefulWidget {
  const Counter_Example({super.key});

  @override
  State<Counter_Example> createState() => _Counter_ExampleState();
}

class _Counter_ExampleState extends State<Counter_Example> {
  @override
  void initState() {
    super.initState();
    final count_provider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 3), (timer) {
      count_provider.set_count();
      count_provider.time.minute.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    final count_provider = Provider.of<CountProvider>(context, listen: false);
    print('build');
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Counter Provider'))),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Consumer<CountProvider>(
              builder: (context, value, child) {
                return Text(
                  value.count.toString(),
                  style: TextStyle(fontSize: 50.sp, color: Colors.black),
                );
              },
            ),
          ),

          Center(
            child: Consumer<CountProvider>(
              builder: (context, value, child) {
                return Text(
                  value.time.toString(),
                  style: TextStyle(fontSize: 50.sp, color: Colors.black),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent[100],
        onPressed: () {
          count_provider.set_count();
        },
        child: Icon(Icons.add, size: 30.sp),
      ),
    );
  }
}
