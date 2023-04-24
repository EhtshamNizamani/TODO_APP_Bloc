import 'package:bloc_api/bloc/task_event.dart';
import 'package:bloc_api/bloc/tasl_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/task.dart';

class TasksBloc extends Bloc<TaskEvent, TaskState> {
  TasksBloc() : super(const TaskState()) {
    on<AddTaskEvent>(_addTask);
    on<UpdateTaskEvent>(_updateTask);
    on<DeleteTaskEvent>(_deleteTask);
    on<RemoveTaskEvent>(_onRemoveTask);
  }
  void _addTask(AddTaskEvent event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
        allTasks: List.from(state.allTasks)..add(event.task),
        removeTask: state.removeTask));
  }

  void _updateTask(UpdateTaskEvent event, Emitter<TaskState> emit) {
    List<Task> allTask = List.from(state.allTasks)..remove(event.task);
    int index = state.allTasks.indexOf(event.task);
    event.task.isDone == false
        ? allTask.insert(index, event.task.copyWith(isDone: true))
        : allTask.insert(index, event.task.copyWith(isDone: false));

    emit(TaskState(allTasks: allTask, removeTask: state.removeTask));
  }

  void _deleteTask(DeleteTaskEvent event, Emitter<TaskState> emit) {
    print('check');

    emit(TaskState(
        allTasks: List.from(state.allTasks)..remove(event.task),
        removeTask: List.from(state.removeTask)..remove(event.task)));
  }

  void _onRemoveTask(RemoveTaskEvent event, Emitter<TaskState> emit) {
    emit(TaskState(
        allTasks: List.from(state.allTasks)..remove(event.task),
        removeTask: List.from(state.removeTask)
          ..add(event.task.copyWith(isDeleted: true))));
  }
}
