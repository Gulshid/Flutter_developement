import 'package:flutter/material.dart';
import 'package:flutter_dev/Flutter_Api/Api_Tasks/Alert_dialoge.dart';
import 'package:flutter_dev/Flutter_Api/Api_Tasks/to_do_tile.dart';

class To_do extends StatefulWidget {
  const To_do({super.key});

  @override
  State<To_do> createState() => _To_doState();
}

class _To_doState extends State<To_do> {
  //text controller
  final _controller = TextEditingController();
  //list 0f to do task
  List to_do = [
    ["Make Tutorial", false],
    ["Make Tutorial", false],
  ];

  //function for checkbox
  void Check_Box_change(bool? value, int index) {
    setState(() {
      to_do[index][1] = !to_do[index][1];
    });
  }

  //function for save new task
  void Save_new_task(){
    setState(() {
      to_do.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
  }

  //function for create new task
  void create_new_task() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialoge_box(
          controller: _controller,
          onsave: Save_new_task,
          oncancel:()=> Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Center(child: Text('To Do')),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          create_new_task;
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: to_do.length,
        itemBuilder: (context, index) {
          return to_do_Tile(
            task_name: to_do[index][0],
            task_completed: to_do[index][1],
            onChanged: (value) => Check_Box_change(value, index),
          );
        },
      ),
    );
  }
}
