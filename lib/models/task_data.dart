import 'package:flutter/cupertino.dart';
import 'package:todoey/models/task.dart';

class TaskData extends ChangeNotifier{

  List<Task> tasks = [
    Task(name: "Click the add button to add new tasks"),
    Task(name: "Click the checkbox to cross off the tasks completed"),
    Task(name: "Drag the task to left or right to dismiss it")
  ];

  void addTask(Task t){
    this.tasks.add(t);
    notifyListeners();
  }

  void removeTask(index){
    this.tasks.removeAt(index);
    notifyListeners();
  }

}