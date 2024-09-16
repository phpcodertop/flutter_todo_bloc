class User {
  final String username;
  final String email;
  final String password;
  final String createdAt;
  final String updatedAt;
  late int? id;

  User({
    required this.username,
    required this.email,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
    this.id
  });

  factory User.fromJson(Map<String, dynamic> user) {
    return User(
      id: user['id'],
      username: user['username'],
      email: user['email'],
      password: user['password'],
      createdAt: user['created_at'],
      updatedAt: user['updated_at'],
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

}