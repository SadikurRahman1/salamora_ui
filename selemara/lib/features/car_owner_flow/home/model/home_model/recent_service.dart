import 'dart:convert';

ServiceResponse serviceResponseFromJson(String str) =>
    ServiceResponse.fromJson(json.decode(str));

String serviceResponseToJson(ServiceResponse data) =>
    json.encode(data.toJson());

class ServiceResponse {
  final bool? success;
  final int? statusCode;
  final String? message;
  final ServiceData? data;

  ServiceResponse({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory ServiceResponse.fromJson(Map<String, dynamic> json) => ServiceResponse(
    success: json["success"],
    statusCode: json["statusCode"],
    message: json["message"],
    data: json["data"] != null ? ServiceData.fromJson(json["data"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "statusCode": statusCode,
    "message": message,
    "data": data?.toJson(),
  };
}

class ServiceData {
  final List<ServiceItem>? data;
  final Meta? meta;

  ServiceData({
    this.data,
    this.meta,
  });

  factory ServiceData.fromJson(Map<String, dynamic> json) => ServiceData(
    data: json["data"] != null
        ? List<ServiceItem>.from(
        json["data"].map((x) => ServiceItem.fromJson(x)))
        : [],
    meta: json["meta"] != null ? Meta.fromJson(json["meta"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "data": data?.map((x) => x.toJson()).toList(),
    "meta": meta?.toJson(),
  };
}

class ServiceItem {
  final String? id;
  final String? vehicleUniqueId;
  final String? serviceType;
  final String? clientSideStatus;
  final String? garageSideStatus;
  final String? serviceStatus;
  final String? urgencyLevel;
  final String? description;
  final Garage? garage;
  final DateTime? preferredDate;
  final DateTime? createdAt;
  final double? estimatedCost;
  final String? vehicleId;
  final String? garageId;
  final Vehicle? vehicle;
  final User? user;
  final double? rating;
  final DateTime? warrantyExpireAt;
  final double? additionalCharge;
  final List<Part>? parts;

  ServiceItem({
    this.id,
    this.vehicleUniqueId,
    this.serviceType,
    this.clientSideStatus,
    this.garageSideStatus,
    this.serviceStatus,
    this.urgencyLevel,
    this.description,
    this.garage,
    this.preferredDate,
    this.createdAt,
    this.estimatedCost,
    this.vehicleId,
    this.garageId,
    this.vehicle,
    this.user,
    this.rating,
    this.warrantyExpireAt,
    this.additionalCharge,
    this.parts,
  });

  factory ServiceItem.fromJson(Map<String, dynamic> json) => ServiceItem(
    id: json["id"],
    vehicleUniqueId: json["vehicleUniqueId"],
    serviceType: json["serviceType"],
    clientSideStatus: json["clientSideStatus"],
    garageSideStatus: json["garageSideStatus"],
    serviceStatus: json["serviceStatus"],
    urgencyLevel: json["urgencyLevel"],
    description: json["description"],
    garage: json["garage"] != null ? Garage.fromJson(json["garage"]) : null,
    preferredDate: json["preferredDate"] != null
        ? DateTime.parse(json["preferredDate"])
        : null,
    createdAt: json["createdAt"] != null
        ? DateTime.parse(json["createdAt"])
        : null,
    estimatedCost: (json["estimatedCost"] != null)
        ? json["estimatedCost"].toDouble()
        : null,
    vehicleId: json["vehicleId"],
    garageId: json["garageId"],
    vehicle:
    json["vehicle"] != null ? Vehicle.fromJson(json["vehicle"]) : null,
    user: json["user"] != null ? User.fromJson(json["user"]) : null,
    rating:
    (json["rating"] != null) ? json["rating"]?.toDouble() : null,
    warrantyExpireAt: json["warrantyExpireAt"] != null
        ? DateTime.parse(json["warrantyExpireAt"])
        : null,
    additionalCharge: json["additionalCharge"] != null
        ? json["additionalCharge"].toDouble()
        : null,
    parts: json["parts"] != null
        ? List<Part>.from(json["parts"].map((x) => Part.fromJson(x)))
        : [],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vehicleUniqueId": vehicleUniqueId,
    "serviceType": serviceType,
    "clientSideStatus": clientSideStatus,
    "garageSideStatus": garageSideStatus,
    "serviceStatus": serviceStatus,
    "urgencyLevel": urgencyLevel,
    "description": description,
    "garage": garage?.toJson(),
    "preferredDate": preferredDate?.toIso8601String(),
    "createdAt": createdAt?.toIso8601String(),
    "estimatedCost": estimatedCost,
    "vehicleId": vehicleId,
    "garageId": garageId,
    "vehicle": vehicle?.toJson(),
    "user": user?.toJson(),
    "rating": rating,
    "warrantyExpireAt": warrantyExpireAt?.toIso8601String(),
    "additionalCharge": additionalCharge,
    "parts": parts?.map((x) => x.toJson()).toList(),
  };
}

class Garage {
  final Business? business;

  Garage({this.business});

  factory Garage.fromJson(Map<String, dynamic> json) => Garage(
    business: json["business"] != null
        ? Business.fromJson(json["business"])
        : null,
  );

  Map<String, dynamic> toJson() => {
    "business": business?.toJson(),
  };
}

class Business {
  final String? businessName;
  final String? businessType;
  final String? website;

  Business({this.businessName, this.businessType, this.website});

  factory Business.fromJson(Map<String, dynamic> json) => Business(
    businessName: json["businessName"],
    businessType: json["businessType"],
    website: json["website"],
  );

  Map<String, dynamic> toJson() => {
    "businessName": businessName,
    "businessType": businessType,
    "website": website,
  };
}

class Vehicle {
  final int? currentMileage;
  final String? name;
  final String? vin;
  final String? brand;
  final String? model;

  Vehicle({
    this.currentMileage,
    this.name,
    this.vin,
    this.brand,
    this.model,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
    currentMileage: json["currentMileage"],
    name: json["name"],
    vin: json["vin"],
    brand: json["brand"],
    model: json["model"],
  );

  Map<String, dynamic> toJson() => {
    "currentMileage": currentMileage,
    "name": name,
    "vin": vin,
    "brand": brand,
    "model": model,
  };
}

class User {
  final String? name;

  User({this.name});

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

class Part {
  final String? name;
  final String? number;
  final double? price;
  final int? quantity;

  Part({
    this.name,
    this.number,
    this.price,
    this.quantity,
  });

  factory Part.fromJson(Map<String, dynamic> json) => Part(
    name: json["name"],
    number: json["number"],
    price: json["price"] != null ? json["price"].toDouble() : null,
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "number": number,
    "price": price,
    "quantity": quantity,
  };
}

class Meta {
  final int? page;
  final int? limit;
  final int? total;
  final int? totalPage;

  Meta({this.page, this.limit, this.total, this.totalPage});

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    page: json["page"],
    limit: json["limit"],
    total: json["total"],
    totalPage: json["totalPage"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "limit": limit,
    "total": total,
    "totalPage": totalPage,
  };
}
