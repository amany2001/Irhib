class Services {
  List<ServiecesData>? service;
  String? message;
  int? status;

  Services({this.service, this.message, this.status});

  Services.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      service = <ServiecesData>[];
      json['data'].forEach((v) {
        service!.add(new ServiecesData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (service != null) {
      data['data'] = service!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class ServiecesData {
  int? id;
  String? name;

  ServiecesData({this.id, this.name});

  ServiecesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
