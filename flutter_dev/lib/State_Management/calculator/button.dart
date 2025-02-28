import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {


   MyButton({Key? key,
     required this.title,
     this.color = Colors.black,
     required  this.onPress
   }) : super(key: key);

   final String title ;
  final Color color;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: InkWell(
        onTap: onPress,
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color
            ),
            child: Center(child: Text(title , style: TextStyle(color: Colors.white , fontSize: 20),)),
          ),
        ),
      ),
    );
  }
}