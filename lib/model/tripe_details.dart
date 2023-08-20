class TripeDetails {
  Data? data;
  String? message;
  int? status;

  TripeDetails({this.data, this.message, this.status});

  TripeDetails.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? mentorName;
  String? mentorImg;
  String? title;
  String? cityId;
  String? city;
  String? tripDuration;
  String? price;
  String? discountCode;
  List<Media>? media;
  List<Services>? services;

  Data(
      {this.id,
      this.mentorName,
      this.mentorImg,
      this.title,
      this.cityId,
      this.city,
      this.tripDuration,
      this.price,
      this.discountCode,
      this.media,
      this.services});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mentorName = json['mentor_name'];
    mentorImg = json['mentor_img'];
    title = json['title'];
    cityId = json['city_id'];
    city = json['city'];
    tripDuration = json['trip_duration'];
    price = json['price'];
    discountCode = json['discount_code'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mentor_name'] = this.mentorName;
    data['mentor_img'] = this.mentorImg;
    data['title'] = this.title;
    data['city_id'] = this.cityId;
    data['city'] = this.city;
    data['trip_duration'] = this.tripDuration;
    data['price'] = this.price;
    data['discount_code'] = this.discountCode;
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  int? id;
  String? name;

  Services({this.id, this.name});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Media {
  int? id;
  String? name;

  Media({this.id, this.name});

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
