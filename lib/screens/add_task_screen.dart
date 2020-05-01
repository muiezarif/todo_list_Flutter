import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/task_data.dart';
class AddTaskScreen extends StatelessWidget {

  static String taskText;
  @override
  Widget build(BuildContext context) {

    return Container(

      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
                color: Colors.lightBlueAccent
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText){
                taskText = newText;
              }
            ),
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
              child: Text(
                "Add",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                Provider.of<TaskData>(context).addTask(taskText);
                Navigator.pop(context);
              },
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
