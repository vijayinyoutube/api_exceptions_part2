// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DemoMode {
  final String userId;
  final String id;
  final String title;
  final bool completed;

  DemoMode(
    this.userId,
    this.id,
    this.title,
    this.completed,
  );

  DemoMode copyWith({
    String? userId,
    String? id,
    String? title,
    bool? completed,
  }) {
    return DemoMode(
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

  factory DemoMode.fromMap(Map<String, dynamic> map) {
    return DemoMode(
      map['userId'] as String,
      map['id'] as String,
      map['title'] as String,
      map['completed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory DemoMode.fromJson(String source) =>
      DemoMode.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DemoMode(userId: $userId, id: $id, title: $title, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DemoMode &&
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
