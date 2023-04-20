// ignore_for_file: public_member_api_docs, sort_constructors_first

class Task {
  String title;
  String id;
  String description;
  bool? isDone;
  bool? isDeleted;

  Task({
    required this.title,
    required this.id,
    required this.description,
    this.isDone,
    this.isDeleted,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'id': id,
      'description': description,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] as String,
      id: map['id'] as String,
      description: map['description'] as String,
      isDone: map['isDone'] as bool,
      isDeleted: map['isDeleted'] as bool,
    );
  }

  Task copyWith({
    String? title,
    String? id,
    String? description,
    bool? isDone,
    bool? isDeleted,
  }) {
    return Task(
      title: title ?? this.title,
      id: id ?? this.id,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}
