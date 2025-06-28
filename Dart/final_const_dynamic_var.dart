void main() {
  //four type instance (var, dynamic, const, final)
  // example of final datatype
  final time =
      DateTime.now(); // can only set at once it prohibated on two or more
  print('The Time is : $time'); // the final datatype is fixed at run time

  // time = DateTime.now(); not working

  // example of var datatype
  var name = 'Ali';
  name = 'Muhammad';
  name = 'Muhammad Ali';
  // name = 122; this is not working because once the first time assign variable on var the first time data store second time when we assign value we must same type of value assign not differeent type
  print('The Name is : $name');

  // example of const datatype
  const pi = 3.14;
  print('The value of pi: $pi');
  // const current = DateTime.now(); this is not valid because in const the value must be constant at compile time

  //example of dynamic datatype
  dynamic demo = 'Hello World';
  demo = 1222;
  print("The value after first value of demo is $demo");
}
