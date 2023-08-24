
class RegisterModel {
  String? name;
  String? email;
  String? phone;
  String? password;
  String? confirmPassword;
  String? type;

  RegisterModel({
    this.name,
    this.email,
    this.phone,
    this.password,
    this.confirmPassword,
    this.type,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['password_confirmation'] = this.confirmPassword;
    data['type'] = this.type;
    return data;
  }
}
