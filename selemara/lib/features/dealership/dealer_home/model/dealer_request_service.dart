import 'dart:convert';

GarageListResponse garageListResponseFromJson(String str) =>
    GarageListResponse.fromJson(json.decode(str));

String garageListResponseToJson(GarageListResponse data) =>
    json.encode(data.toJson());

class GarageListResponse {
  bool? success;
  int? statusCode;
  String? message;
  GarageListData? data;

  GarageListResponse({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GarageListResponse.fromJson(Map<String, dynamic> json) =>
      GarageListResponse(
        success: json["success"],
        statusCode: json["statusCode"],
        message: json["message"],
        data:
        json["data"] != null ? GarageListData.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
    "success": success,
    "statusCode": statusCode,
    "message": message,
    "data": data?.toJson(),
  };
}

class GarageListData {
  List<Garage>? data;
  Meta? meta;

  GarageListData({
    this.data,
    this.meta,
  });

  factory GarageListData.fromJson(Map<String, dynamic> json) => GarageListData(
    data: json["data"] != null
        ? List<Garage>.from(json["data"].map((x) => Garage.fromJson(x)))
        : [],
    meta: json["meta"] != null ? Meta.fromJson(json["meta"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "data": data?.map((x) => x.toJson()).toList(),
    "meta": meta?.toJson(),
  };
}

class Garage {
  String? id;
  String? name;

  Garage({
    this.id,
    this.name,
  });

  factory Garage.fromJson(Map<String, dynamic> json) => Garage(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Meta {
  int? page;
  int? limit;
  int? total;
  int? totalPage;

  Meta({
    this.page,
    this.limit,
    this.total,
    this.totalPage,
  });

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
