import 'package:flutter/material.dart';
import 'package:flutter_dev/State_Management/Provider/theme_changer_provider.dart';
import 'package:provider/provider.dart';

class dark_white_Changer extends StatefulWidget {
  const dark_white_Changer({super.key});

  @override
  State<dark_white_Changer> createState() => _dark_white_ChangerState();
}

class _dark_white_ChangerState extends State<dark_white_Changer> {
  @override
  Widget build(BuildContext context) {
   final themeChanger = Provider.of<Theme_Changer>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Theme Changer Provider',style: TextStyle(color: Colors.white),)),
      ),

      body: Column(
        children: [
            RadioListTile<ThemeMode>(
              title: Text('Light Mode'),
              value: ThemeMode.light,
               groupValue: themeChanger.theme_Mode,
                onChanged: themeChanger.set_theme),

            RadioListTile<ThemeMode>(
              title: Text('Dark Mode'),
              value: ThemeMode.dark,
               groupValue: themeChanger.theme_Mode,
                onChanged: themeChanger.set_theme),  


             RadioListTile<ThemeMode>(
              title: Text('System Mode'),
              value: ThemeMode.system,
               groupValue: themeChanger.theme_Mode,
                onChanged: themeChanger.set_theme),  

            Icon(Icons.favorite),
        
        ],
      ),
    );
  }
}