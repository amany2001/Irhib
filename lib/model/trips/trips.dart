import 'package:irhib/model/trips/tripes_service.dart';

class Trips {
  int? id;
  String? title;
  String? mentorId;
  String? cityId;
  String? price;
  String? discountCode;
  String? image;
  String? createdAt;
  List<TripsServices>? tripsservices;

  Trips(
      {this.id,
      this.title,
      this.mentorId,
      this.cityId,
      this.price,
      this.discountCode,
      this.image,
      this.createdAt,
      this.tripsservices});

  Trips.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    mentorId = json['mentor_id'];
    cityId = json['city_id'];
    price = json['price'];
    discountCode = json['discount_code'];
    image = json['image'];
    createdAt = json['created_at'];
    if (json['services'] != null) {
      tripsservices = <TripsServices>[];
      json['services'].forEach((v) {
        tripsservices!.add(new TripsServices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['mentor_id'] = mentorId;
    data['city_id'] = cityId;
    data['price'] = price;
    data['discount_code'] = discountCode;
    data['image'] = image;
    data['created_at'] = createdAt;
    if (tripsservices != null) {
      data['services'] = tripsservices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
