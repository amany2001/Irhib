class User {
  int? id;
  String? name;
  String? countryId;
  String? phone;
  String? email;
  String? bio;
  String? image;
  String? status;
  String? type;
  String? password;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.countryId,
      this.phone,
      this.email,
      this.bio,
      this.image,
      this.status,
      this.type,
      this.password,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
    phone = json['phone'];
    email = json['email'];
    bio = json['bio'];
    image = json['image'];
    status = json['status'];
    type = json['type'];
    password = json['password'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country_id'] = this.countryId;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['bio'] = this.bio;
    data['image'] = this.image;
    data['status'] = this.status;
    data['type'] = this.type;
    data['password'] = this.password;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
