import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DialogeButtons extends StatelessWidget {
  final String text;
  VoidCallback onpressed;
   DialogeButtons({super.key,required this.text,required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      color: Colors.yellow[200],
      child:Text(text),
    );
  }
}
