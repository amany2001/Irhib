class Providers {
  Data? data;
  String? message;
  int? status;

  Providers({this.data, this.message, this.status});

  Providers.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  List<ProvidersData>? providers;

  Data({this.providers});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['providers'] != null) {
      providers = <ProvidersData>[];
      json['providers'].forEach((v) {
        providers!.add(new ProvidersData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.providers != null) {
      data['providers'] = this.providers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProvidersData {
  int? id;
  String? name;
  String? email;
  String? location;

  ProvidersData({this.id, this.name, this.email, this.location});

  ProvidersData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['location'] = this.location;
    return data;
  }
}
