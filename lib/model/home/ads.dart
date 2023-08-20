class Ads {
  List<AdsData>? adsData;
  String? message;
  int? status;

  Ads({this.adsData, this.message, this.status});

  Ads.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      adsData = <AdsData>[];
      json['data'].forEach((v) {
        adsData!.add(AdsData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (adsData != null) {
      data['data'] = adsData!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class AdsData {
  int? id;
  String? title;
  String? img;

  AdsData({this.id, this.title, this.img});

  AdsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['img'] = img;
    return data;
  }
}
