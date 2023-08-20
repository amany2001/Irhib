class Cities {
  List<CityData>? cities;
  String? message;
  int? status;

  Cities({this.cities, this.message, this.status});

  Cities.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      cities = <CityData>[];
      json['data'].forEach((v) {
        cities!.add(new CityData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (cities != null) {
      data['data'] = cities!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class CityData {
  int? id;
  String? name;
  String? img;

  CityData({this.id, this.name, this.img});

  CityData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['img'] = img;
    return data;
  }
}
