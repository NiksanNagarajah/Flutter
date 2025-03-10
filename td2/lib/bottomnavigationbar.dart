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
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: "Information",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contrast),
          label: "Contrast",
        ),
      ],
      selectedItemColor: Colors.amber[800],
      currentIndex: selectedIndex,
      onTap: onItemTapped,
    );
  }
}