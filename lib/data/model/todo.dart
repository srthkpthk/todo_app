import 'package:flutter/foundation.dart';

class Todo {
  final int id;
  final String title;
  final String color;
  final Map<String,bool> tasks;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const Todo({
    @required this.id,
    @required this.title,
    @required this.color,
    @required this.tasks,
  });

  Todo copyWith({
    int id,
    String title,
    String color,
    Map<String, bool> tasks,
  }) {
    if ((id == null || identical(id, this.id)) &&
        (title == null || identical(title, this.title)) &&
        (color == null || identical(color, this.color)) &&
        (tasks == null || identical(tasks, this.tasks))) {
      return this;
    }

    return new Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      color: color ?? this.color,
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, color: $color, tasks: $tasks}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Todo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          color == other.color &&
          tasks == other.tasks);

  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode ^ color.hashCode ^ tasks.hashCode;

  factory Todo.fromMap(Map<String, dynamic> map) {
    return new Todo(
      id: map['id'] as int,
      title: map['title'] as String,
      color: map['color'] as String,
      tasks: map['tasks'] as Map<String, bool>,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'title': this.title,
      'color': this.color,
      'tasks': this.tasks,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
