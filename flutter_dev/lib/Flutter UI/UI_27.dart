import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Sliverappbar extends StatefulWidget {
  const Sliverappbar({super.key});

  @override
  State<Sliverappbar> createState() => _SliverappbarState();
}

class _SliverappbarState extends State<Sliverappbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.blueAccent,
            leading: Icon(Icons.menu, color: Colors.black,),
            title: Text('Sliver AppBar', style: TextStyle(color: Colors.white),),
            floating: true,
            pinned: true,
            expandedHeight: 200.sp,
            flexibleSpace: FlexibleSpaceBar(
            background: Container(color: Colors.red, child: Center(child: Text('Hello world', style: TextStyle(color: Colors.white),),),),
            // title:Text('Sliver AppBar', style: TextStyle(color: Colors.white),),
            
            ),
          ),
      
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                  height: 400.h,
                  color: Colors.deepPurple[200],
                ),
              ),
            ),
          ),
      
      
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                  height: 400.h,
                  color: Colors.deepPurple[200],
                ),
              ),
            ),
          ),
      
      
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                  height: 400.h,
                  color: Colors.deepPurple[200],
                ),
              ),
            ),
          ),
      
      
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                  height: 400.h,
                  color: Colors.deepPurple[200],
                ),
              ),
            ),
          ),
        ],
      
      ),
      
    );
  }
}