// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dev/State_Management/practise/provider/count_p.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class count extends StatefulWidget {
  const count({super.key});

  @override
  State<count> createState() => _countState();
}

class _countState extends State<count> {
  @override
  void initState() {
    super.initState();
    final count_pro = Provider.of<CountP>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      count_pro.set_value();
    });
  }

  @override
  Widget build(BuildContext context) {
    // final count_pro = Provider.of<CountP>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text('Practise Count'), centerTitle: true),

      body: Column(
        children: [
          Consumer<CountP>(
            builder: (context, value, child) {
              return Center(
                child: Text(
                  value.count.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 60.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // count_pro.set_value();
          // count_pro.setCurrentDateTime();
        },
        child: Icon(Icons.add, color: Colors.black, size: 40.sp),
      ),
    );
  }
}
