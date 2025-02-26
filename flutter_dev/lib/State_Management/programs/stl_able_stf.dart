import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class STl_able_Stf extends StatelessWidget {
  STl_able_Stf({Key? key}) : super(key: key);

  ValueNotifier counter = ValueNotifier<int>(0);
  ValueNotifier toggle = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Stl able stf', style: TextStyle(color: Colors.white)),
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Stateless able as a Stateful Widget',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.h),

          ValueListenableBuilder(
            valueListenable: toggle,
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  obscureText: toggle.value,
                  decoration: InputDecoration(
                    suffix: InkWell(
                      onTap: () {
                        toggle.value = !toggle.value;
                      },
                      child: Icon(
                        toggle.value
                            ? Icons.visibility_off
                            : Icons.visibility_sharp,
                      ),
                    ),
                    labelText: 'Enter Anything',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              );
            },
          ),

          Center(
            child: ValueListenableBuilder(
              valueListenable: counter,
              builder: (context, value, child) {
                return Text(
                  counter.value.toString(),
                  style: TextStyle(color: Colors.black, fontSize: 50.sp),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 185, 161, 200),
        onPressed: () {
          counter.value++;
          print(counter.value.toString());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
