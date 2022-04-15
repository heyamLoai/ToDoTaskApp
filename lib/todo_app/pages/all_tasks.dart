import 'package:flutter/material.dart';

import '../data/tasks_data.dart';
import '../widgets/task_widget.dart';

class AllTasksScreen extends StatelessWidget {
  Function fun;
  Function deleteTask;

  AllTasksScreen(this.fun, this.deleteTask);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: tasksList.length,
        itemBuilder: (context, index) {
          return TaskWidget(tasksList[index], fun, deleteTask);
        });
  }
}
