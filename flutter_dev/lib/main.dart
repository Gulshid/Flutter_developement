import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter_dev/Flutter_Api/Api_Models/To_do_hive_model.dart';
// import 'package:flutter_dev/Flutter_Api/Api_Models/Hive_notes_model.dart';
// import 'package:flutter_dev/Flutter_Api/Api_Tasks/Hive_.dart';
import 'package:flutter_dev/Flutter_Api/Api_Tasks/hive_to_do.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
// import 'package:path_provider/path_provider.dart';
// ignore: unnecessary_import
import 'package:hive/hive.dart';

void main() async {
  //for hive database
  // initialize hive local database...
  // await Hive.initFlutter();
  //open the box
  // var box = await Hive.openBox('mybox');

  //for Hive program 1
  // WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  // await Hive.openBox('Box');

  // for Hive program 2
  // WidgetsFlutterBinding.ensureInitialized();
  // var dir = await getApplicationDocumentsDirectory();
  // Hive.init(dir.path);

  //hive database task
  // WidgetsFlutterBinding.ensureInitialized();
  // var directory = await getApplicationDocumentsDirectory();
  // Hive.init(directory.path);

  // Hive.registerAdapter(notes1Adapter());
  // await Hive.openBox<notes_1>('notes');

  //to do app and  Hive database

  to_do_model db = to_do_model();

  await Hive.initFlutter();
  var box = await Hive.openBox('to do');
  // ignore: unused_element
  void initState() {
    if (box.get('to do List') == null) {
      db.create_initial_data();
    
    }
    else{
        db.load_data();
    }
    // super.initState();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Dev',
          theme: ThemeData(
            appBarTheme: AppBarTheme(color: Colors.blue),
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: To_do(),
        );
      },
    );
  }
}
