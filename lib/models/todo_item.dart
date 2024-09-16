
class TodoItem {
  int id;
  final String content;
  final int userId;
  final String category;
  final String createdAt;
  final String updatedAt;

  TodoItem({
    this.id = 0,
    required this.content,
    required this.userId,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TodoItem.fromJson(Map<String, dynamic> user) {
    return TodoItem(
      id: user['id'],
      userId: user['user_id'],
      content: user['content'],
      category: user['category'],
      createdAt: user['created_at'],
      updatedAt: user['updated_at'],
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'content': content,
      'category': category,
      'user_id': userId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

}