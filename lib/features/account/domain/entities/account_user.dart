class AccountUser {
  final String uid;
  final String email;

  AccountUser({required this.uid, required this.email});

  Map<String, dynamic> toJson() {
    return {'uid': uid, 'email': email};
  }

  factory AccountUser.fromJson(Map<String, dynamic> json) {
    return AccountUser(
      uid: json['uid'] as String,
      email: json['email'] as String,
    );
  }
}
