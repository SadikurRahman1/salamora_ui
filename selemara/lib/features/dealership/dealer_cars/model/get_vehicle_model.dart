
class VehicleResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  VehicleData? data;

  VehicleResponseModel({this.success, this.statusCode, this.message, this.data});

  factory VehicleResponseModel.fromJson(Map<String, dynamic> json) {
    return VehicleResponseModel(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? "",
      data: json['data'] != null ? VehicleData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'statusCode': statusCode,
    'message': message,
    'data': data?.toJson(),
  };
}

class VehicleData {
  List<Vehicle>? data;
  Meta? meta;

  VehicleData({this.data, this.meta});

  factory VehicleData.fromJson(Map<String, dynamic> json) {
    return VehicleData(
      data: json['data'] != null
          ? List<Vehicle>.from(
        json['data'].map((x) => Vehicle.fromJson(x)),
      )
          : [],
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'data': data?.map((x) => x.toJson()).toList(),
    'meta': meta?.toJson(),
  };
}

class Vehicle {
  String? id;
  String? vin;
  String? name;
  String? brand;
  String? model;
  String? year;
  String? color;
  int? currentMileage;
  List<Document>? documents;
  List<String>? images;
  String? ownerId;
  bool? isSold;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? totalService;
  dynamic lastService;
  bool? isVerified;

  Vehicle({
    this.id,
    this.vin,
    this.name,
    this.brand,
    this.model,
    this.year,
    this.color,
    this.currentMileage,
    this.documents,
    this.images,
    this.ownerId,
    this.isSold,
    this.createdAt,
    this.updatedAt,
    this.totalService,
    this.lastService,
    this.isVerified,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['id']?.toString(),
      vin: json['vin']?.toString(),
      name: json['name'] ?? "",
      brand: json['brand'] ?? "",
      model: json['model'] ?? "",
      year: json['year']?.toString(),
      color: json['color'] ?? "",
      currentMileage: json['currentMileage'] is int
          ? json['currentMileage']
          : int.tryParse(json['currentMileage']?.toString() ?? "0"),
      documents: json['documents'] != null
          ? List<Document>.from(
        json['documents'].map((x) => Document.fromJson(x)),
      )
          : [],
      images: json['images'] != null
          ? List<String>.from(json['images'])
          : [],
      ownerId: json['ownerId']?.toString(),
      isSold: json['isSold'] ?? false,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
      totalService: json['totalService'] is int
          ? json['totalService']
          : int.tryParse(json['totalService']?.toString() ?? "0"),
      lastService: json['lastService'],
      isVerified: json['isVerified'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'vin': vin,
    'name': name,
    'brand': brand,
    'model': model,
    'year': year,
    'color': color,
    'currentMileage': currentMileage,
    'documents': documents?.map((x) => x.toJson()).toList(),
    'images': images,
    'ownerId': ownerId,
    'isSold': isSold,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    'totalService': totalService,
    'lastService': lastService,
    'isVerified': isVerified,
  };
}

class Document {
  String? name;
  String? url;

  Document({this.name, this.url});

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      name: json['name'] ?? "",
      url: json['url'] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'url': url,
  };
}

class Meta {
  int? page;
  int? limit;
  int? total;
  int? totalPage;

  Meta({this.page, this.limit, this.total, this.totalPage});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      page: json['page'] ?? 0,
      limit: json['limit'] ?? 0,
      total: json['total'] ?? 0,
      totalPage: json['totalPage'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'page': page,
    'limit': limit,
    'total': total,
    'totalPage': totalPage,
  };
}
