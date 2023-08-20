class ServicesProvider {
  int? id;
  String? service;
  String? serviceImg;

  ServicesProvider({this.id, this.service, this.serviceImg});

  ServicesProvider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    service = json['service'];
    serviceImg = json['service_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['service'] = service;
    data['service_img'] = serviceImg;
    return data;
  }
}
