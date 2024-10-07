class UserModel {
  final String name;
  final String email;
  final String password;
  final String? confirmPassword;

  UserModel(
      {required this.name,
      required this.email,
      required this.password,
      this.confirmPassword});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
