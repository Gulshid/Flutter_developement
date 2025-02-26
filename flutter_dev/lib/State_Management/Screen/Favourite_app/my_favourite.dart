import 'package:flutter/material.dart';
import 'package:flutter_dev/State_Management/Provider/Favourite_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class my_favourite extends StatefulWidget {
  const my_favourite({super.key});

  @override
  State<my_favourite> createState() => _my_favouriteState();
}

class _my_favouriteState extends State<my_favourite> {
  @override
  Widget build(BuildContext context) {
    final favourite_provider = Provider.of<Favourite_app>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Configuration Screen', style: TextStyle(color: Colors.white)),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => my_favourite()),
              );
            },
            child: Icon(Icons.favorite),
          ),
          SizedBox(width: 20.sp),
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: favourite_provider.selected.length,
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
