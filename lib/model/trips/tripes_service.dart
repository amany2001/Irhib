class TripsServices {
  int? id;
  String? name;
  String? serviceImg;

  TripsServices({this.id, this.name, this.serviceImg});

  TripsServices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    serviceImg = json['service_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['service_img'] = serviceImg;
    return data;
  }
}
