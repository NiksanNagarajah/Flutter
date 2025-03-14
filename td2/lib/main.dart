import 'package:flutter/material.dart';
import 'package:td2/bottomnavigationbar.dart';
import 'package:td2/ecran_api_rest_fetched_task.dart';
import 'package:td2/ecran_generate_task.dart';
import 'package:td2/ecran_json_fetched_task.dart';

import 'mytheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  static ThemeData theme = MyTheme.dark();
  final List<Widget> _pages = [
    EcranGenerateTask(),
    EcranJsonFetchedTask(),
    EcranAPIRestFetchedTask()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TD2',
      theme: MyTheme.light(),
      darkTheme: MyTheme.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("New Application"),
          centerTitle: true,
          // backgroundColor: Colors.teal,
        ),
        body: _pages[_selectedIndex],
        //backgroundColor: Colors.grey,
        bottomNavigationBar: BottomNavigationbar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        )
      ),
    );
  }
}
