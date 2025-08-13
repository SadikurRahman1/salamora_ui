class VehicleResponse {
  final bool success;
  final int statusCode;
  final String message;
  final VehicleData data;

  VehicleResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory VehicleResponse.fromJson(Map<String, dynamic> json) {
    return VehicleResponse(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: VehicleData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'statusCode': statusCode,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class VehicleData {
  final List<Vehicle> data;
  final Meta meta;

  VehicleData({
    required this.data,
    required this.meta,
  });

  factory VehicleData.fromJson(Map<String, dynamic> json) {
    return VehicleData(
      data: (json['data'] as List)
          .map((e) => Vehicle.fromJson(e))
          .toList(),
      meta: Meta.fromJson(json['meta']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'meta': meta.toJson(),
    };
  }
}

class Vehicle {
  final String id;
  final String uniqueId;
  final String vin;
  final String name;
  final String brand;
  final String model;
  final String year;
  final String color;
  final int currentMileage;
  final List<String> documents;
  final List<String> images;
  final String ownerId;
  final bool isSold;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int totalService;
  final String? lastService;

  Vehicle({
    required this.id,
    required this.uniqueId,
    required this.vin,
    required this.name,
    required this.brand,
    required this.model,
    required this.year,
    required this.color,
    required this.currentMileage,
    required this.documents,
    required this.images,
    required this.ownerId,
    required this.isSold,
    required this.createdAt,
    required this.updatedAt,
    required this.totalService,
    this.lastService,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['id'] ?? '',
      uniqueId: json['uniqueId'] ?? '',
      vin: json['vin'] ?? '',
      name: json['name'] ?? '',
      brand: json['brand'] ?? '',
      model: json['model'] ?? '',
      year: json['year'] ?? '',
      color: json['color'] ?? '',
      currentMileage: json['currentMileage'] ?? 0,
      documents: List<String>.from(json['documents'] ?? []),
      images: List<String>.from(json['images'] ?? []),
      ownerId: json['ownerId'] ?? '',
      isSold: json['isSold'] ?? false,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      totalService: json['totalService'] ?? 0,
      lastService: json['lastService'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uniqueId': uniqueId,
      'vin': vin,
      'name': name,
      'brand': brand,
      'model': model,
      'year': year,
      'color': color,
      'currentMileage': currentMileage,
      'documents': documents,
      'images': images,
      'ownerId': ownerId,
      'isSold': isSold,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'totalService': totalService,
      'lastService': lastService,
    };
  }
}

class Meta {
  final int page;
  final int limit;
  final int total;
  final int totalPage;

  Meta({
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      page: json['page'] ?? 0,
      limit: json['limit'] ?? 0,
      total: json['total'] ?? 0,
      totalPage: json['totalPage'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'limit': limit,
      'total': total,
      'totalPage': totalPage,
    };
  }
}
