// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_dev/Flutter_Api/Api_Models/To_do_hive_model.dart';
import 'package:flutter_dev/Flutter_Api/Api_Tasks/Alert_dialoge.dart';
import 'package:flutter_dev/Flutter_Api/Api_Tasks/to_do_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hive/hive.dart';

class To_do extends StatefulWidget {
  const To_do({super.key});

  @override
  State<To_do> createState() => _To_doState();
}

class _To_doState extends State<To_do> {
  //reference the hive database box
  final _box = Hive.box('to do');
  //list of to do task
  to_do_model db = to_do_model();
  void initState() {
    if (_box.get('to do List') == null) {
      db.create_initial_data();
    }
    else{
        db.load_data();
    }
    super.initState();
  }


  //text controller
  final _controller = TextEditingController();
  
  //function for checkbox
  void Check_Box_change(bool? value, int index) {
    setState(() {
      db.to_do[index][1] = !db.to_do[index][1];
    });
    db.update_data();
  }

  //function for save new task
  void Save_new_task() {
    setState(() {
      db.to_do.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.update_data();

  }

  //function for create new task
  void create_new_task() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialoge_box(
          controller: _controller,
          onsave: Save_new_task,
          oncancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //function for delete task
  void delete_Task(int index) {
    setState(() {
      db.to_do.removeAt(index);
    });
   db.update_data();

  }

  // ignore: annotate_overrides
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Center(child: Text('To Do')),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: () {
          // create_new_task;
          create_new_task();
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.to_do.length,
        itemBuilder: (context, index) {
          return to_do_Tile(
            task_name: db.to_do[index][0],
            task_completed: db.to_do[index][1],
            onChanged: (value) => Check_Box_change(value, index),
            delete_function: (context) => delete_Task(index),
          );
        },
      ),
    );
  }
}
