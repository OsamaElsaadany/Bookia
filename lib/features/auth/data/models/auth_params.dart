class AuthParams {
  String? email;
  String? name;
  String? password;
  String? confirmpassword;
  String? verifycode;

  AuthParams({
    this.name,
    this.email,
    this.password,
    this.confirmpassword,
    this.verifycode,
  });

  factory AuthParams.fromJson(Map<String, dynamic> json) {
    return AuthParams(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      confirmpassword: json['password_confirmation'],
      verifycode: json['verify_code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      if (password != null) 'new_password': password,
      if (confirmpassword != null) 'new_password_confirmation': confirmpassword,
      'verify_code': verifycode,
    };
  }
}
