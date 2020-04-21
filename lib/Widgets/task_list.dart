import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoey/models/task_data.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child){
        return  ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (context, int index) {
            return Dismissible(
              key: Key(taskData.tasks[index].name),
              background: Container(
                color: Colors.lightBlueAccent,
              ),
              child: TaskTile(
                taskTitle: taskData.tasks[index].name,
                isChecked: taskData.tasks[index].isDone,
                checkBoxCallback: (bool newCheckboxState) {
                  taskData.updateTask(taskData.tasks[index]);
                },
                longPressCallback: (){
                  taskData.removeTask(index);
                },
              ),
              onDismissed: (direction) {
                taskData.removeTask(index);
              },
            );
            },
        );
      },
    );
  }
}
