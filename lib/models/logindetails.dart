class LoginDetails {
  int? id;
  String? userName;
  String? fullName;
  String? email;
  String? password;
  String? mobile;

  LoginDetails({this.id, this.userName, this.fullName, this.email, this.password, this.mobile});

  LoginDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    fullName = json['fullName'];
    email = json['email'];
    password = json['password'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['mobile'] = this.mobile;
    return data;
  }
}
