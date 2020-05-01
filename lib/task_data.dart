import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:todolist/models/tasks.dart';

class TaskData extends ChangeNotifier{
  List<Task> _tasks=[
    Task(name: "Task1"),
    Task(name: "Task2"),
    Task(name: "Task3"),
  ];

  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }
  int get taskCount{
    return _tasks.length;
  }

  void addTask(String newTask){
    _tasks.add(Task(name: newTask));
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}