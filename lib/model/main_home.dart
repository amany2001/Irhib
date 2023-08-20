class Home {
  List<HomeData>? homeDetails;
  String? message;
  int? status;

  Home({this.homeDetails, this.message, this.status});

  Home.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      homeDetails = <HomeData>[];
      json['data'].forEach((v) {
        homeDetails!.add(HomeData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.homeDetails != null) {
      data['data'] = this.homeDetails!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class HomeData {
  int? id;
  String? name;
  String? img;

  HomeData({this.id, this.name, this.img});

  HomeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['img'] = img;
    return data;
  }
}
