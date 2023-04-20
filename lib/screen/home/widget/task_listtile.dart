import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/task_bloc.dart';
import '../../../bloc/task_event.dart';
import '../../../model/task.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    super.key,
    required this.data,
  });

  final Task data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        data.isDeleted!
            ? context.read<TasksBloc>().add(DeleteTaskEvent(task: data))
            : context.read<TasksBloc>().add(RemoveTaskEvent(task: data));
      },
      child: ExpansionTile(
        title: Text(
          data.title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            decoration:
                data.isDone! ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        trailing: SizedBox(
          width: 80,
          child: Row(
            children: [
              Checkbox(
                  value: data.isDone,
                  onChanged: (_) {
                    context.read<TasksBloc>().add(UpdateTaskEvent(task: data));
                  }),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        children: [
          ListTile(
            leading: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Title',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(data.title),
              ],
            ),
          ),
          ListTile(
            leading: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Description',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(data.description)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
