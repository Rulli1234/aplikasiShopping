class Pengguna {
  final int? id;
  final String username;
  final String email;
  final String password;

  Pengguna({
    this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'username': username, 'email': email, 'password': password};
  }

  factory Pengguna.fromMap(Map<String, dynamic> map) {
    return Pengguna(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      password: map['password'],
    );
  }
}
