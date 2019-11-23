class LoginModel {
  String username;
  String password;
  LoginModel({this.username, this.password});
  toJson() {
    return {
      'username': this.username,
      'password': this.password,
    };
  }
}

class RegisterModel {
  String username;
  String password;
  String email;
  String mobile;

  toJson() {
    return {
      'username': this.username,
      'password': this.password,
      'mobile': this.mobile,
      'email': this.email,
    };
  }
}
