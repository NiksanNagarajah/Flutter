import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td2/viewModel/task_view_model.dart';
import '../models/task.dart';

class EcranGenerateTask extends StatelessWidget {

  late List<Task> taches = Task.generateTask(4);
  EcranGenerateTask({super.key});

  @override
  Widget build(BuildContext context) {
    taches = context.watch<TaskViewModel>().liste;
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: taches.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(backgroundColor: Colors.white10, child: Text(taches[index].id.toString())),
            // CircleAvatar(child: FlutterLogo()),
            title: Text(taches[index].title),
            subtitle: Text("Description : " + taches[index].description + (taches[index].tags.isNotEmpty ? "\n• ${taches[index].tags.join("\n• ")}" : "") //+ taches[index].id.toString()subtitle: Text(taches[index].description),
            ),
            mouseCursor: SystemMouseCursors.click,
          ),
        );
      }
    );
  }
}

