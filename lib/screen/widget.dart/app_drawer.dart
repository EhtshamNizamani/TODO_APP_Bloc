import 'package:bloc_api/screen/home/recycle.dart';
import 'package:bloc_api/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/task_bloc.dart';
import '../../bloc/tasl_state.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: Colors.white,
          child: BlocBuilder<TasksBloc, TaskState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Task Drawer',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    },
                    leading: const Icon(Icons.folder_special),
                    title: const Text('My Task'),
                    trailing: Text('${state.allTasks.length}'),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, RecycelBinScreen.routeName);
                    },
                    leading: const Icon(
                      Icons.folder_special,
                    ),
                    title: const Text('Bin'),
                    trailing: Text(state.removeTask.length.toString()),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
