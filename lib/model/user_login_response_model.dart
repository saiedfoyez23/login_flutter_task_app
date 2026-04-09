class UserLoginResponseModel {
  var token;
  UserLoginResponse? user;

  UserLoginResponseModel({this.token, this.user});

  UserLoginResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new UserLoginResponse.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class UserLoginResponse {
  var id;
  var name;
  var email;
  var emailVerified;
  var image;
  var createdAt;
  var updatedAt;

  UserLoginResponse({
    this.id,
    this.name,
    this.email,
    this.emailVerified,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  UserLoginResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerified = json['emailVerified'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['emailVerified'] = this.emailVerified;
    data['image'] = this.image;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
