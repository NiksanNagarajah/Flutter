import 'package:flutter/cupertino.dart';
import '../models/task.dart';

class TaskViewModel extends ChangeNotifier{
  late List<Task> liste;

  TaskViewModel(){
    liste=[];
  }
  void addTask(Task task){
    liste.add(task);
    notifyListeners();
  }
  void generateTasks(){
    liste = Task.generateTask(5);
    notifyListeners();
  }
}