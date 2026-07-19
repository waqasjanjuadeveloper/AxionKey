class PasswordModel {
  final String id;
  final String website;
  final String email;
  final String password;
  final String note;

  PasswordModel({
    required this.id,
    required this.website,
    required this.email,
    required this.password,
    required this.note,
  });

  factory PasswordModel.fromMap(Map<String, dynamic> map, String id) {
    return PasswordModel(
      id: id,
      website: map['website'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      note: map['note'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'website': website,
      'email': email,
      'password': password,
      'note': note,
    };
  }
}
