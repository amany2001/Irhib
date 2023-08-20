import 'package:irhib/model/user.dart';

class Auth {
  String? accessToken;
  String? tokenType;
  User? user;

  Auth({this.accessToken, this.tokenType, this.user});

  Auth.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
