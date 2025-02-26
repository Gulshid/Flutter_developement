import 'package:flutter/material.dart';
import 'package:flutter_dev/State_Management/Provider/Exam_provider_1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Example_1 extends StatefulWidget {
  const Example_1({super.key});

  @override
  State<Example_1> createState() => _Example_1State();
}

class _Example_1State extends State<Example_1> {
  @override
  Widget build(BuildContext context) {
    print('object:');
    // final provider = Provider.of<Example_One_Provider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Example_1 Provider'))),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<Example_One_Provider>(
            builder: (context, value, child) {
              return Slider(
                min: 0,
                max: 1,
                value: value.value,
                onChanged: (val) {
                  value.set_Value(val);
                },
              );
            },
          ),

          Consumer<Example_One_Provider>(
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use
                          color: Colors.blue.withOpacity(value.value),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Center(child: Text('Container 1')),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        height: 100.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use
                          color: Colors.brown.withOpacity(value.value),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Center(child: Text('Container 2')),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
