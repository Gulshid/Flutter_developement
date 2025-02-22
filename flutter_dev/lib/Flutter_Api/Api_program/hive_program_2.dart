// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class hive_2 extends StatefulWidget {
  const hive_2({super.key});

  @override
  State<hive_2> createState() => _hive_2State();
}

class _hive_2State extends State<hive_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Hive Database'))),
      body: Column(
        children: [
          FutureBuilder(
            future: Hive.openBox('Box'),
            builder: (context, snapshot) {
              return Column(
                children: [
                  Text(snapshot.data!.get('name').toString()),
                ],
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var box = await Hive.openBox('Box');
          //add some value
          box.put('name', 'Gulshid Zada');
          box.put('Roll NO', 391);
          box.put('Semester', '4th');
          box.put('document', {'hello': 'World', 'pak': 'istan'});
          //get the store data from hive data base
          // ignore: avoid_print
          print(box.get('name'));
          print(box.get('Roll NO'));
          print(box.get('Semester'));
          print(box.get('document')['hello']);
        },

        child: Icon(Icons.help_outline),
      ),
    );
  }
}
