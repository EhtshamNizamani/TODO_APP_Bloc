import 'package:bloc_api/model/task.dart';
import 'package:equatable/equatable.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();
  @override
  List<Object> get props => [];
}

class AddTaskEvent extends TaskEvent {
  final Task task;
  const AddTaskEvent({required this.task});
  @override
  List<Object> get props => [task];
}

class DeleteTaskEvent extends TaskEvent {
  final Task task;
  const DeleteTaskEvent({required this.task});
  @override
  List<Object> get props => [task];
}

class RemoveTaskEvent extends TaskEvent {
  final Task task;
  const RemoveTaskEvent({required this.task});
  @override
  List<Object> get props => [task];
}

class UpdateTaskEvent extends TaskEvent {
  final Task task;
  const UpdateTaskEvent({required this.task});
  @override
  List<Object> get props => [task];
}
