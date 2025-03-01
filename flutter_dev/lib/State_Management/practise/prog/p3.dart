import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class p3 extends StatelessWidget {
  p3({Key? key}) : super(key: key);

  ValueNotifier toogle = ValueNotifier<bool>(true);
  ValueNotifier increment = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stateless is able to reflect',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          increment.value++;
          print(increment.value);
        },
        child: Icon(Icons.add, color: Colors.black, size: 40.sp),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ValueListenableBuilder(
              valueListenable: toogle,
              builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.black),
                    // obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter the text value',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          toogle.value = !toogle.value;
                        },
                        child: Icon(
                          toogle.value
                              ? Icons.visibility
                              : Icons.visibility_off_sharp,
                          color: Colors.lightGreen,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Center(
            child: ValueListenableBuilder(
              valueListenable: increment,
              builder: (context, value, child) {
                return Center(
                  child: Text(
                    increment.value.toString(),
                    style: TextStyle(color: Colors.black, fontSize: 40.sp),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
