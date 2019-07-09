class LoginModel {
  String username;
  String password;

  toJson() {
    return {
      'username': this.username,
      'password': this.password,
    };
  }
}
