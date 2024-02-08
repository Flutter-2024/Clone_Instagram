class User {
  final String id;
  final String fullName;
  final String username;
  final String? imageUrl;

  User({
    this.id = "U001", // Default value for "id
    required this.fullName,
    required this.username,
    this.imageUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullName: json['name'],
      username: json['username'],
    );
  }
}
