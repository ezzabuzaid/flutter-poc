class LoginModel {
  final String username;
  final String password;

  LoginModel({this.username, this.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      password: json['password'],
      username: json['username'],
    );
  }

  toJson() {
    return {
      'username': this.username,
      'password': this.password,
    };
  }
}
