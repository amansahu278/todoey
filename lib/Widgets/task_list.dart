import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoey/models/task.dart';

// ignore: must_be_immutable
class TasksList extends StatefulWidget {
  TasksList({this.tasks,this.onDismiss});

  Function onDismiss;
  List<Task> tasks;

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, int index) {
        return Dismissible(
          key: Key(widget.tasks[index].name),
          background: Container(
            color: Colors.lightBlueAccent,
          ),
          child: TaskTile(
            taskTitle: widget.tasks[index].name,
            isChecked: widget.tasks[index].isDone,
            checkBoxCallback: (bool newCheckboxState) {
              setState(() {
                widget.tasks[index].isDone = newCheckboxState;
              });
            },
          ),
          onDismissed: (direction) {
            setState(() {
              widget.tasks.removeAt(index);
              widget.onDismiss();
            });
          },
        );
      },
    );
  }
}
