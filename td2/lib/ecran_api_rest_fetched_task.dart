import 'package:flutter/material.dart';
import 'package:td2/models/my_api_rest.dart';
import 'package:td2/ecran_task_detail.dart';

class EcranAPIRestFetchedTask extends StatelessWidget {

  static MyApiRest apiService = MyApiRest();

  const EcranAPIRestFetchedTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Liste des tâches")),
      body: FutureBuilder<List<dynamic>>(
        future: apiService.fetchTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Erreur : ${snapshot.error}"));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var task = snapshot.data![index];
                return ListTile(
                  leading: CircleAvatar(backgroundColor: Colors.white10, child: Text(task["id"].toString())),
                  title: Text(task["title"]),
                  subtitle: Text("ID: ${task["id"]}"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TaskDetailScreen(task: task),),
                    );
                  },
                  trailing: Icon(Icons.info),
                );
              },
            );
          }
        },
      ),
    );
  }
}
