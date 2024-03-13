class UserModel {
  final String username;
  final String password;

  const UserModel({
    required this.username,
    required this.password
  });

  Map<String, Object?> toMap() {
    return {
      'username': username,
      'password': password
    };
  }
}