import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class p1 extends StatefulWidget {
  p1({Key? key}) : super(key: key);

  @override
  State<p1> createState() => _p1State();
}

class _p1State extends State<p1> {
  int increment = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent[100],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
           increment++;
          print(increment); 
           });
       
        },
        child: Icon(Icons.add, color: Colors.black, size: 20.sp),
      ),
      appBar: AppBar(title: Text('State less Widget'), centerTitle: true),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [Center(
          child:
           Text("$increment",style: TextStyle(color: Colors.black,fontSize: 50.sp,fontWeight: FontWeight.bold),)
           ),

          
           ]),
    );
  }
}
