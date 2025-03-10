import 'dart:io';

import 'package:flutter/material.dart';
import 'package:td2/models/my_api.dart';
import 'models/task.dart';

class EcranInformation extends StatelessWidget {
  const EcranInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Task>>(
      future: MyAPI().getTasks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator()); // Loader en attendant les données
        } else if (snapshot.hasError) {
          return Center(child: Text("Erreur : ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("Aucune tâche trouvée."));
        }

        final taches = snapshot.data!;

        return ListView.builder(
          itemCount: taches.length,
          itemBuilder: (context, index) {
            final tache = taches[index];
            return Card(
              child: ListTile(
                leading: CircleAvatar(backgroundColor: Colors.white10, child: Text(tache.id.toString())),
                title: Text(tache.title),
                subtitle: Text("Description : " + tache.description + (tache.tags.isNotEmpty ? "\n• ${tache.tags.join("\n• ")}" : "") //+ tache.id.toString()subtitle: Text(task.description),
                ),
                mouseCursor: SystemMouseCursors.click,
              )
            );
          },
        );
      },
    );
  }
}
