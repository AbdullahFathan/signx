class User {
  final String uid;
  final String email;

  User({required this.uid, required this.email});

  Map<String, dynamic> toJson() {
    return {'uid': uid, 'email': email};
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(uid: json['uid'] as String, email: json['email'] as String);
  }
}
