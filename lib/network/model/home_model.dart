class HomeResModel {
  CurrentBookings? currentBookings;
  List<Packages>? packages;

  HomeResModel({this.currentBookings, this.packages});

  HomeResModel.fromJson(Map<String, dynamic> json) {
    currentBookings = json['current_bookings'] != null ? CurrentBookings.fromJson(json['current_bookings']) : null;
    if (json['packages'] != null) {
      packages = <Packages>[];
      json['packages'].forEach((v) {
        packages!.add(Packages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (currentBookings != null) {
      data['current_bookings'] = currentBookings!.toJson();
    }
    if (packages != null) {
      data['packages'] = packages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CurrentBookings {
  String? packageLabel;
  String? fromDate;
  String? fromTime;
  String? toDate;
  String? toTime;

  CurrentBookings({this.packageLabel, this.fromDate, this.fromTime, this.toDate, this.toTime});

  CurrentBookings.fromJson(Map<String, dynamic> json) {
    packageLabel = json['package_label'];
    fromDate = json['from_date'];
    fromTime = json['from_time'];
    toDate = json['to_date'];
    toTime = json['to_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['package_label'] = packageLabel;
    data['from_date'] = fromDate;
    data['from_time'] = fromTime;
    data['to_date'] = toDate;
    data['to_time'] = toTime;
    return data;
  }
}

class Packages {
  int? id;
  String? packageName;
  int? price;
  String? description;

  Packages({this.id, this.packageName, this.price, this.description});

  Packages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packageName = json['package_name'];
    price = json['price'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['package_name'] = packageName;
    data['price'] = price;
    data['description'] = description;
    return data;
  }
}
