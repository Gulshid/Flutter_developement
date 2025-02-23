import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class to_do_Tile extends StatelessWidget {
  final String task_name;
  final bool task_completed;
  Function(bool?)? onChanged;
  to_do_Tile({super.key,required this.task_name,required this.task_completed,required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(12.r),
        ),

        child: Row(
          children: [
            Checkbox(value: task_completed,
             onChanged: onChanged,
            activeColor: Colors.blue,),
            Text(task_name,style: TextStyle(decoration:task_completed? TextDecoration.lineThrough:TextDecoration.none),),
          ],
        ),
      ),
    );
  }
}
