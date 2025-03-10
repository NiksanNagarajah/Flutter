import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/task.dart';

class EcranGenerateTask extends StatelessWidget {

  const EcranGenerateTask({super.key});

  @override
  Widget build(BuildContext context) {
    List<Task> taches = Task.generateTask(4);
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [Center(child: Text("Tâches générées", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
        for (var tache in taches)
          Card(
            child: ListTile(
              leading: CircleAvatar(backgroundColor: Colors.white10, child: Text(tache.id.toString())),
              // CircleAvatar(child: FlutterLogo()),
              title: Text(tache.title),
              subtitle: Text("Description : " + tache.description + (tache.tags.isNotEmpty ? "\n• ${tache.tags.join("\n• ")}" : "") //+ tache.id.toString()subtitle: Text(task.description),
                ),
            mouseCursor: SystemMouseCursors.click,
            ),
          )
      ],
    );
  }
}

