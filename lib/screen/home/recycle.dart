import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/task_bloc.dart';
import '../../bloc/task_event.dart';
import '../../bloc/tasl_state.dart';
import '../../model/task.dart';
import '../widget.dart/app_drawer.dart';

class RecycelBinScreen extends StatelessWidget {
  static const String routeName = 'recycle_bin';
  const RecycelBinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recycle Screen'),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: BlocBuilder<TasksBloc, TaskState>(
          builder: (context, state) {
            return Column(
              children: [
                Center(
                  child: Chip(
                    label: Text('Task ${state.removeTask.length}'),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: state.removeTask.length,
                      itemBuilder: (context, index) {
                        Task data = state.removeTask[index];

                        return ListTile(
                          onLongPress: () {
                            context
                                .read<TasksBloc>()
                                .add(DeleteTaskEvent(task: data));
                          },
                          title: Text(
                            data.title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              decoration: data.isDone!
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          trailing: Checkbox(
                              value: data.isDone,
                              onChanged: data.isDeleted! ? null : (_) {}),
                        );
                      }),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
