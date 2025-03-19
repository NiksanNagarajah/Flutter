import 'package:flutter/material.dart';

class TaskDetailScreen extends StatelessWidget {
  final task;

  TaskDetailScreen({required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(task.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Titre: ${task.title}", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("ID: ${task.id}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("Complété: ${task.completed ? "Oui" : "Non"}", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
