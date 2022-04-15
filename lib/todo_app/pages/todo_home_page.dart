import 'dart:ui';

import 'package:flutter/material.dart';

import '../data/tasks_data.dart';
import '../models/task_model.dart';
import 'all_tasks.dart';
import 'complete_tasks.dart';
import 'incomplete_tasks.dart';

class TodoHomePage extends StatefulWidget {
  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  changeTaskCompleteness(Task task) {
    int index = tasksList.indexOf(task);
    tasksList[index].isCompleted = !tasksList[index].isCompleted;
    setState(() {});
  }

  deleteTask(Task task) {
    int index = tasksList.indexOf(task);
    tasksList.removeAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
          backgroundColor:Color.fromARGB(255,135, 67, 86),
            title: const Text('To Do APP'),
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.list),
                text: 'All Tasks',
              ),
              Tab(
                icon: Icon(Icons.done),
                text: 'Complete Tasks',
              ),
              Tab(
                icon: Icon(Icons.cancel),
                text: 'InComplete Tasks',
              )
            ]),
          ),
          body: TabBarView(
            children: [
              AllTasksScreen(changeTaskCompleteness, deleteTask),
              CompleteTasksScreen(changeTaskCompleteness, deleteTask),
              InCompleteTasksScreen(changeTaskCompleteness, deleteTask)
            ],
          ),
        ));
  }
}