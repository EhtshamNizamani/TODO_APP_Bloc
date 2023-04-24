import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../bloc/task_bloc.dart';
import '../../bloc/task_event.dart';
import '../../model/task.dart';

class AddTask extends StatelessWidget {
  const AddTask({
    super.key,
    required this.taskController,
    required this.description,
  });

  final TextEditingController taskController;
  final TextEditingController description;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'Add Task',
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: taskController,
                decoration: const InputDecoration(
                    hintText: 'Add Task', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: description,
                decoration: const InputDecoration(
                    hintText: 'Add Description', border: OutlineInputBorder()),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel')),
                  ElevatedButton(
                      onPressed: () {
                        final id = const Uuid().v4();
                        context.read<TasksBloc>().add(AddTaskEvent(
                            task: Task(
                                title: taskController.text,
                                id: id,
                                description: description.text)));
                        taskController.text = '';
                        description.text = '';

                        Navigator.of(context).pop();
                      },
                      child: const Text('Add Task'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
