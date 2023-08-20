import 'package:irhib/model/service_providers.dart';
import 'package:irhib/model/trips/trips.dart';

class ExploreModel {
  ExploreData? exploreData;
  String? message;
  int? status;

  ExploreModel({this.exploreData, this.message, this.status});

  ExploreModel.fromJson(Map<String, dynamic> json) {
    exploreData =
        json['data'] != null ? ExploreData.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.exploreData != null) {
      data['data'] = this.exploreData!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class ExploreData {
  int? id;
  String? name;
  String? img;
  List<Trips>? trips;
  List<Mentors>? mentors;
  List<ServicesProvider>? servicesProvider;

  ExploreData(
      {this.id,
      this.name,
      this.img,
      this.trips,
      this.mentors,
      this.servicesProvider});

  ExploreData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    if (json['trips'] != null) {
      trips = <Trips>[];
      json['trips'].forEach((v) {
        trips!.add(Trips.fromJson(v));
      });
    }
    if (json['mentors'] != null) {
      mentors = <Mentors>[];
      json['mentors'].forEach((v) {
        mentors!.add(Mentors.fromJson(v));
      });
    }
    if (json['services'] != null) {
      servicesProvider = <ServicesProvider>[];
      json['services'].forEach((v) {
        servicesProvider!.add(ServicesProvider.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['img'] = img;
    if (trips != null) {
      data['trips'] = trips!.map((v) => v.toJson()).toList();
    }
    if (mentors != null) {
      data['mentors'] = mentors!.map((v) => v.toJson()).toList();
    }
    if (servicesProvider != null) {
      data['services'] = servicesProvider!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Mentors {
  int? id;
  String? name;
  String? image;

  Mentors({this.id, this.name, this.image});

  Mentors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}
