// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../model/task.dart';

class TaskState extends Equatable {
  final List<Task> allTasks;
  final List<Task> removeTask;

  const TaskState({
    this.allTasks = const <Task>[],
    this.removeTask = const <Task>[],
  });

  @override
  List<Object> get props => [allTasks, removeTask];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allTasks': allTasks.map((x) => x.toMap()).toList(),
      'removeTask': removeTask.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      allTasks: List<Task>.from(
        (map['allTasks'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
      removeTask: List<Task>.from(
        (map['removeTask'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
