import 'package:flutter/material.dart';
import 'package:flutter_dev/State_Management/calculator/button.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {


  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 178, 148, 230),
      body: SafeArea(
        child: Column(

          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.centerRight,
                        child: Text(
                          userInput,
                          style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        alignment: Alignment.centerRight,
                        child: Text(
                          answer,
                          style: TextStyle(
                              fontSize: 60,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ]),
              ),
            ),

            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        MyButton(title: 'AC',onPress: () {
                          setState(() {
                            userInput = '';
                            answer = '0';
                          });
                        },),
                        MyButton(title: '+/-',onPress: () {

                        },),
                        MyButton(title: '%',onPress: () {
                          setState(() {
                            userInput += '%';
                          });
                        },),
                        MyButton(title: '/',onPress: () {
                          setState(() {
                            userInput += '/';
                          });
                        }, color: Color(0xffffa00a),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        MyButton(title: '7',onPress: () {
                          setState(() {
                            userInput += '7';
                          });
                        },),
                        MyButton(title: '8',onPress: () {
                          setState(() {
                            userInput += '8';
                          });
                        },),
                        MyButton(title: '0',onPress: () {
                          setState(() {
                            userInput += '0';
                          });
                        },),
                        MyButton(title: 'x',onPress: () {
                          setState(() {
                            userInput += 'x';
                          });
                        }, color: Color(0xffffa00a),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        MyButton(title: '4',onPress: () {
                          setState(() {
                            userInput += '4';
                          });
                        },),
                        MyButton(title: '5',onPress: () {
                          setState(() {
                            userInput += '5';
                          });
                        },),
                        MyButton(title: '6',onPress: () {
                          setState(() {
                            userInput += '6';
                          });
                        },),
                        MyButton(title: '-',onPress: () {
                          setState(() {
                            userInput += '-';
                          });
                        }, color: Color(0xffffa00a),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        MyButton(title: '1', onPress: () {
                          setState(() {
                            userInput += '1';
                          });
                        },
                        ),
                        MyButton(title: '2',onPress: () {
                          setState(() {
                            userInput += '2';
                          });
                        },),
                        MyButton(title: '3',onPress: () {
                          setState(() {
                            userInput += '3';
                          });
                        },),
                        MyButton(title: '+', onPress: () {
                          setState(() {
                            userInput += '+';
                          });
                        },color: Color(0xffffa00a),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        MyButton(title: '0',onPress: () {
                          setState(() {
                            userInput += '0';
                          });
                        },),
                        MyButton(title: '.',onPress: () {
                          setState(() {
                            userInput += '.';
                          });
                        },),
                        MyButton(title: 'DEL',onPress: () {
                          setState(() {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                          });
                        },),
                        MyButton(title: '=', onPress: () {
                          equalPressed();
                          setState(() {

                          });
                        },color: Color(0xffffa00a),),
                      ],
                    ),
                  ),

                ],
              ),
            ),


          ],
        ),
      ),
    );
  }


  void equalPressed() {

    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }


  }