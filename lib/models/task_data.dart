import 'package:flutter/cupertino.dart';
import 'package:todoey/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier{

  List<Task> _tasks = [
    Task(name: "Click the add button to add new tasks"),
    Task(name: "Click the checkbox to cross off the tasks completed"),
    Task(name: "Long press on a task or slide the task to dismiss it")
  ];

  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }

  int get taskCount{
    return _tasks.length;
  }

  void addTask(Task t){
    _tasks.add(t);
    notifyListeners();
  }

  void removeTask(index){
    _tasks.removeAt(index);
    notifyListeners();
  }

  void updateTask(Task t){
    t.toggleDone();
    notifyListeners();
  }

}