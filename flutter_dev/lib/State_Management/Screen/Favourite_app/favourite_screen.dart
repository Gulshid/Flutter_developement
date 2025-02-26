import 'package:flutter/material.dart';
import 'package:flutter_dev/State_Management/Provider/Favourite_provider.dart';
import 'package:flutter_dev/State_Management/Screen/Favourite_app/my_favourite.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Favourite_Screen extends StatefulWidget {
  const Favourite_Screen({super.key});

  @override
  State<Favourite_Screen> createState() => _Favourite_ScreenState();
}

class _Favourite_ScreenState extends State<Favourite_Screen> {
  List<int> selected_item = [];
  @override
  Widget build(BuildContext context) {
    // final favourite_provider = Provider.of<Favourite_app>(
    //   context,
    //   listen: false,
    // );
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Favourite App', style: TextStyle(color: Colors.white)),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>my_favourite()),
              );
            },
            child: Icon(Icons.favorite,color: Colors.deepPurple,),
          ),
          SizedBox(width: 20.sp),
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Consumer<Favourite_app>(
                  builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selected.contains(index)) {
                          value.remove_item(index);
                        } else {
                          value.add_item(index);
                        }
                      },
                      title: Text(
                        'item:' + index.toString(),
                        style: TextStyle(color: Colors.black),
                      ),
                      trailing: Icon(
                        value.selected.contains(index)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
