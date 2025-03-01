// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dev/State_Management/practise/provider/count_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class count extends StatefulWidget {
  const count({super.key});

  @override
  State<count> createState() => _countState();
}

class _countState extends State<count> {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<Count_>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text('hello'),centerTitle: true
      ,),

      body: Consumer<Count_>(
        builder: (context, value, child) {
          return Center(child: Text(value.incre.toString(),style:TextStyle(color: Colors.black,fontSize: 60.sp)));
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pro.set_co();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
