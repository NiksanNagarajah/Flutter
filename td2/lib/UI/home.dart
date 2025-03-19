
import 'package:flutter/material.dart';
import 'package:td2/UI/add_task.dart';
import 'bottomnavigationbar.dart';
import 'ecran_api_rest_fetched_task.dart';
import 'ecran_generate_task.dart';
import 'ecran_json_fetched_task.dart';
import 'ecran_settings.dart';

class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    EcranGenerateTask(),
    EcranJsonFetchedTask(),
    EcranAPIRestFetchedTask(),
    EcranSettings()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("MyApp"),
            centerTitle: true,
            // backgroundColor: Colors.teal,
          ),
          body: _pages[_selectedIndex],
          //backgroundColor: Colors.grey,
          bottomNavigationBar: BottomNavigationbar(
            selectedIndex: _selectedIndex,
            onItemTapped: _onItemTapped,
          ),
          floatingActionButton: _selectedIndex==0?FloatingActionButton(
            onPressed: (){ Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => const AddTask(),
                ));
            },
            child: const Icon(Icons.add),):const SizedBox.shrink(),
      );
  }
}