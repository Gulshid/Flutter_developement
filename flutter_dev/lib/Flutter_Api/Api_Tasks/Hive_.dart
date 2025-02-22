// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_dev/Flutter_Api/Api_Models/Hive_notes_boxes.dart';
import 'package:flutter_dev/Flutter_Api/Api_Models/Hive_notes_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class hive_task extends StatefulWidget {
  const hive_task({super.key});

  @override
  State<hive_task> createState() => _hive_taskState();
}

class _hive_taskState extends State<hive_task> {
  final title_controller = TextEditingController();
  final description_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Hive Task'))),
      body: ValueListenableBuilder<Box<notes_1>>(
        valueListenable: boxes.getData().listenable(),
        builder: (context, box, _) {
          var data = box.values.toList().cast<notes_1>();
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              return Card(
                // color: Colors.black12,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            data[index].title.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              delete(data[index]);
                            },
                            child: Icon(
                              Icons.delete,
                              color: const Color.fromARGB(255, 220, 23, 9),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          InkWell(
                            onTap: () {
                              edit_show_dialoge(
                                data[index],
                                data[index].title.toString(),
                                data[index].description.toString(),
                              );
                            },
                            child: Icon(Icons.edit),
                          ),
                        ],
                      ),
                      Text(
                        data[index].description.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          show_dialoge();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  //function for edit the record
  Future<void> edit_show_dialoge(
    notes_1,
    String title,
    String description,
  ) async {
    title_controller.text = title;
    description_controller.text = description;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text('Update Note', style: TextStyle(color: Colors.blue)),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: title_controller,
                  decoration: InputDecoration(
                    hintText: 'Enter the title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),

                SizedBox(height: 10.h),

                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: description_controller,
                  decoration: InputDecoration(
                    hintText: 'Enter the description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                notes_1.title = title_controller.text;
                notes_1.description = description_controller.text;
                notes_1.save();

                title_controller.clear();
                description_controller.clear();

                Navigator.pop(context);
              },
              child: Text('Edit'),
            ),
          ],
        );
      },
    );
  }

  //function for delete the record
  void delete(notes_1) async {
    await notes_1.delete();
  }

  //function for add the information
  Future<void> show_dialoge() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text('Add Note', style: TextStyle(color: Colors.blue)),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: title_controller,
                  decoration: InputDecoration(
                    hintText: 'Enter the title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),

                SizedBox(height: 10.h),

                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: description_controller,
                  decoration: InputDecoration(
                    hintText: 'Enter the description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final data = notes_1(
                  title: title_controller.text,
                  description: description_controller.text,
                );

                final box = boxes.getData();
                box.add(data);

                data.save();
                print(box);
                title_controller.clear();
                description_controller.clear();

                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
