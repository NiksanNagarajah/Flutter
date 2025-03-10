import 'package:flutter/material.dart';
class BottomNavigationbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavigationbar({
    required this.selectedIndex,
    required this.onItemTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.task_rounded),
          label: "Generated",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.task_alt_rounded),
          label: "Json",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.web),
          label: "API Rest",
        ),
      ],
      selectedItemColor: Colors.amber[800],
      currentIndex: selectedIndex,
      onTap: onItemTapped,
    );
  }
}