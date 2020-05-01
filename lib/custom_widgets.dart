import 'package:flutter/material.dart';
import 'package:todolist/models/tasks.dart';
import 'package:provider/provider.dart';
import 'package:todolist/task_data.dart';

class TaskList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              onLongPress: (){
                taskData.deleteTask(task);
              },
              taskTitle: task.name,
              isChecked: task.isDone,
              onChanged: (value) {
                taskData.updateTask(task);
              },
            );
          },
          itemCount: taskData
              .taskCount,
        );
      },
    );
  }
}

class TaskTile extends StatelessWidget {
  TaskTile({this.isChecked, this.onChanged, this.taskTitle,this.onLongPress});

  final bool isChecked;
  final String taskTitle;
  final Function onChanged;
  final Function onLongPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
      title: Text(
        '$taskTitle',
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: onChanged,
      ),
    );
  }
}
