class Countries {
  List<CountryData>? countries;
  String? message;
  int? status;

  Countries({this.countries, this.message, this.status});

  Countries.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      countries = <CountryData>[];
      json['data'].forEach((v) {
        countries!.add(CountryData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.countries != null) {
      data['data'] = this.countries!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class CountryData {
  int? id;
  String? name;

  CountryData({this.id, this.name});

  CountryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
