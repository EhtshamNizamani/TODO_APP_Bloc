// ignore_for_file: must_be_immutable

import 'package:bloc_api/model/task.dart';
import 'package:bloc_api/screen/home/widget/task_listtile.dart';
import 'package:bloc_api/screen/widget.dart/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/task_bloc.dart';
import '../../bloc/tasl_state.dart';
import '../widget.dart/add_task.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  HomeScreen({super.key});
  TextEditingController taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      drawer: const AppDrawer(),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<TasksBloc, TaskState>(
            builder: (context, state) {
              return Column(
                children: [
                  Center(
                    child: Chip(
                      label: Text('Task ${state.allTasks.length}'),
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: state.allTasks.length,
                          itemBuilder: (context, index) {
                            Task data = state.allTasks[index];
                            return TaskListTile(data: data);
                          })),
                ],
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AddTaskScreen(context);
          (context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<dynamic> AddTaskScreen(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return AddTask(
            taskController: taskController,
            description: descriptionController,
          );
        });
  }
}
