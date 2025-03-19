import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:td2/models/todo.dart';
import 'package:http/http.dart' as http;


class MyApiRest {
  static const String baseUrl = "https://jsonplaceholder.typicode.com/todos";

  Future<List<dynamic>> fetchTasks() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      final todos = <Todo>[];

      for (var element in json) {
        todos.add(Todo.fromJson(element));
      }

      return todos;
    } else {
      throw Exception("Échec du chargement des tâches");
    }
  }

  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}

