import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dev/State_Management/Provider/Auth_provider.dart';
import 'package:flutter_dev/State_Management/Provider/Exam_provider_1.dart';
import 'package:flutter_dev/State_Management/Provider/Favourite_provider.dart';
import 'package:flutter_dev/State_Management/Provider/count_provider.dart';
import 'package:flutter_dev/State_Management/Provider/theme_changer_provider.dart';
import 'package:flutter_dev/State_Management/practise/prog/p1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
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
  // await Hive.initFlutter();
  // var box = await Hive.openBox('to do');
  // Hive.init(box.path);

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
        return MultiProvider(
          providers: [
            //1,2,...... provider reference
            ChangeNotifierProvider(create: (_) => CountProvider()),
            ChangeNotifierProvider(create: (_) => Example_One_Provider()),
            ChangeNotifierProvider(create: (_) => Favourite_app()),
            ChangeNotifierProvider(create: (_) => Theme_Changer()),
            ChangeNotifierProvider(create: (_) => auth_provider()),

          ],

          child: Builder(
            builder: (BuildContext context) {
            // this is reference to theme changer in state Management
           final themeChanger = Provider.of<Theme_Changer>(context);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Dev',
                themeMode: themeChanger.theme_Mode,
                theme: ThemeData(
                   brightness: Brightness.light,
                  appBarTheme: AppBarTheme(color: Colors.blue),
                  primarySwatch: Colors.blue,
                  textTheme: Typography.englishLike2018.apply(
                    fontSizeFactor: 1.sp,
                  ),
                ),

                // darkTheme: ThemeData(
                //   appBarTheme: AppBarTheme(
                //       color: Colors.teal,
                //   ),
                //   primarySwatch: Colors.deepPurple,
                //   brightness: Brightness.dark,
                //   iconTheme: IconThemeData(
                //     color: Colors.lightGreen
                //   )
                // ),
                home:p1(),
           
              );
            },
          ),
        );
      },
    );
  }
}
