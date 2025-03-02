import 'package:flutter/material.dart';
import 'package:flutter_dev/State_Management/practise/provider/opacity_Provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ColorChanger extends StatefulWidget {
  const ColorChanger({super.key});

  @override
  State<ColorChanger> createState() => _ColorChangerState();
}

class _ColorChangerState extends State<ColorChanger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Changer', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<OpacityProvider>(
            builder: (context, value, child) {
              return Slider(
                activeColor: Colors.teal,
                inactiveColor: Colors.brown,
                min: 0,
                max: 1,
                value: value.variable,
                onChanged: (varia) {
                  value.set_Color(varia);
                },
              );
            },
          ),

          Consumer<OpacityProvider>(
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 120.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use
                          color: Colors.deepOrange.withOpacity(value.variable),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      
                        child: Center(child: Text('The Color Opacity will change')),
                      ),
                    ),
                    SizedBox(width: 20.w,),
                    Expanded(
                      child: Container(
                        height: 120.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use
                          color: Colors.teal.withOpacity(value.variable),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      
                        child: Center(child: Text('The Color Opacity will change')),
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
