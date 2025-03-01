import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class p1 extends StatefulWidget {
  p1({Key? key}) : super(key: key);

  @override
  State<p1> createState() => _p1State();
}

class _p1State extends State<p1> {
  //count example
  int _counter = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateless Widget', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text('$_counter',style: TextStyle(color: Colors.black,fontSize: 60.sp),))]),
      //flaoting action button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
          _counter++;
          print(_counter);
          });
         
        },
        child: Icon(Icons.add, color: Colors.black, size: 30.sp),
      ),
    );
  }
}
