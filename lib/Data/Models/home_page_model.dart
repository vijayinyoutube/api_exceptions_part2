// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DemoModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  DemoModel(
    this.userId,
    this.id,
    this.title,
    this.completed,
  );

  DemoModel copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) {
    return DemoModel(
      userId ?? this.userId,
      id ?? this.id,
      title ?? this.title,
      completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  factory DemoModel.fromMap(Map<String, dynamic> map) {
    return DemoModel(
      map['userId'] as int,
      map['id'] as int,
      map['title'] as String,
      map['completed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory DemoModel.fromJson(String source) =>
      DemoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DemoModel(userId: $userId, id: $id, title: $title, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DemoModel &&
        other.userId == userId &&
        other.id == id &&
        other.title == title &&
        other.completed == completed;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ id.hashCode ^ title.hashCode ^ completed.hashCode;
  }
}
