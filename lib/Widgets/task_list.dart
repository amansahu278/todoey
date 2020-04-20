import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoey/models/task_data.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    var tasks = Provider.of<TaskData>(context).tasks;
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, int index) {
        return Dismissible(
          key: Key(tasks[index].name),
          background: Container(
            color: Colors.lightBlueAccent,
          ),
          child: TaskTile(
            taskTitle: tasks[index].name,
            isChecked: tasks[index].isDone,
            checkBoxCallback: (bool newCheckboxState) {
              setState(() {
                tasks[index].toggleDone();
              });
            },
          ),
          onDismissed: (direction) {
            setState(() {
              Provider.of<TaskData>(context, listen: false).removeTask(index);
            });
          },
        );
      },
    );
  }
}
