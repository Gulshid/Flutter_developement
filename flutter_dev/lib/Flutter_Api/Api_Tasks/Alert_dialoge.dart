import 'package:flutter/material.dart';
import 'package:flutter_dev/Flutter_Api/Api_Tasks/dialoge_buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Dialoge_box extends StatelessWidget {
  final controller;
  VoidCallback onsave;
  VoidCallback oncancel;

  Dialoge_box({super.key, required this.controller,required this.onsave,required this.oncancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 250.h,
        width: 250.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              style: TextStyle(color: Colors.black),
              controller: controller,
              decoration: InputDecoration(
                labelText: 'Enter the Task',labelStyle: TextStyle(fontSize: 20.sp,color: Colors.blue),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                DialogeButtons(text: 'Save', onpressed: onsave),
                SizedBox(width: 20.w),
                //Cancel button
                DialogeButtons(text: 'Cancel', onpressed:oncancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
