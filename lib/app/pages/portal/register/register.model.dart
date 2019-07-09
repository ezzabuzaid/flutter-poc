class RegisterModel {
  String username;
  String password;
  String email;
  String mobile;

  toJson() {
    return {
      'username': this.username,
      'password': this.password,
      'mobile': this.password,
      'email': this.email,
    };
  }
}
