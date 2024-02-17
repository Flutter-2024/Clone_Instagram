class User {
  final String id;
  final String fullName;
  final String username;
  final String? imageUrl;

  User({
    required this.id,
    required this.fullName,
    required this.username,
    this.imageUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    String id = json['id'].toString().padLeft(3, '0');
    return User(
      id: "U$id",
      fullName: json['name'],
      username: json['username'],
    );
  }
}
