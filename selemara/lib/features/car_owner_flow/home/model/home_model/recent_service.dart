class ServiceResponse {
  final bool success;
  final int statusCode;
  final String message;
  final ServiceData data;

  ServiceResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ServiceResponse.fromJson(Map<String, dynamic> json) {
    return ServiceResponse(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: ServiceData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() => {
    "success": success,
    "statusCode": statusCode,
    "message": message,
    "data": data.toJson(),
  };
}

class ServiceData {
  final List<ServiceResult> result;
  final Meta meta;

  ServiceData({
    required this.result,
    required this.meta,
  });

  factory ServiceData.fromJson(Map<String, dynamic> json) {
    return ServiceData(
      result: (json['result'] as List)
          .map((e) => ServiceResult.fromJson(e))
          .toList(),
      meta: Meta.fromJson(json['meta']),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result.map((e) => e.toJson()).toList(),
    "meta": meta.toJson(),
  };
}

class ServiceResult {
  final String id;
  final String vehicleUniqueId;
  final String serviceType;
  final String clientSideStatus;
  final String garageSideStatus;
  final String serviceStatus;
  final String urgencyLevel;
  final String description;
  final Garage garage;
  final DateTime preferredDate;
  final DateTime createdAt;
  final num estimatedCost;
  final String vehicleId;
  final String garageId;
  final Vehicle vehicle;
  final User user;
  final double? rating;
  final DateTime? warrantyExpireAt;
  final num? additionalCharge;
  final List<Part> parts;

  ServiceResult({
    required this.id,
    required this.vehicleUniqueId,
    required this.serviceType,
    required this.clientSideStatus,
    required this.garageSideStatus,
    required this.serviceStatus,
    required this.urgencyLevel,
    required this.description,
    required this.garage,
    required this.preferredDate,
    required this.createdAt,
    required this.estimatedCost,
    required this.vehicleId,
    required this.garageId,
    required this.vehicle,
    required this.user,
    this.rating,
    this.warrantyExpireAt,
    this.additionalCharge,
    required this.parts,
  });

  factory ServiceResult.fromJson(Map<String, dynamic> json) {
    return ServiceResult(
      id: json['id'] ?? '',
      vehicleUniqueId: json['vehicleUniqueId'] ?? '',
      serviceType: json['serviceType'] ?? '',
      clientSideStatus: json['clientSideStatus'] ?? '',
      garageSideStatus: json['garageSideStatus'] ?? '',
      serviceStatus: json['serviceStatus'] ?? '',
      urgencyLevel: json['urgencyLevel'] ?? '',
      description: json['description'] ?? '',
      garage: Garage.fromJson(json['garage']),
      preferredDate: DateTime.parse(json['preferredDate']),
      createdAt: DateTime.parse(json['createdAt']),
      estimatedCost: json['estimatedCost'] ?? 0,
      vehicleId: json['vehicleId'] ?? '',
      garageId: json['garageId'] ?? '',
      vehicle: Vehicle.fromJson(json['vehicle']),
      user: User.fromJson(json['user']),
      rating: json['rating'] != null
          ? (json['rating'] as num).toDouble()
          : null,
      warrantyExpireAt: json['warrantyExpireAt'] != null
          ? DateTime.tryParse(json['warrantyExpireAt'])
          : null,
      additionalCharge: json['additionalCharge'],
      parts: (json['parts'] as List)
          .map((e) => Part.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "vehicleUniqueId": vehicleUniqueId,
    "serviceType": serviceType,
    "clientSideStatus": clientSideStatus,
    "garageSideStatus": garageSideStatus,
    "serviceStatus": serviceStatus,
    "urgencyLevel": urgencyLevel,
    "description": description,
    "garage": garage.toJson(),
    "preferredDate": preferredDate.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "estimatedCost": estimatedCost,
    "vehicleId": vehicleId,
    "garageId": garageId,
    "vehicle": vehicle.toJson(),
    "user": user.toJson(),
    "rating": rating,
    "warrantyExpireAt": warrantyExpireAt?.toIso8601String(),
    "additionalCharge": additionalCharge,
    "parts": parts.map((e) => e.toJson()).toList(),
  };
}

class Garage {
  final Business business;

  Garage({required this.business});

  factory Garage.fromJson(Map<String, dynamic> json) {
    return Garage(
      business: Business.fromJson(json['business']),
    );
  }

  Map<String, dynamic> toJson() => {
    "business": business.toJson(),
  };
}

class Business {
  final String businessName;
  final String businessType;
  final String website;

  Business({
    required this.businessName,
    required this.businessType,
    required this.website,
  });

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      businessName: json['businessName'] ?? '',
      businessType: json['businessType'] ?? '',
      website: json['website'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    "businessName": businessName,
    "businessType": businessType,
    "website": website,
  };
}

class Vehicle {
  final int currentMileage;
  final String name;
  final String vin;
  final String brand;
  final String model;

  Vehicle({
    required this.currentMileage,
    required this.name,
    required this.vin,
    required this.brand,
    required this.model,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      currentMileage: json['currentMileage'] ?? 0,
      name: json['name'] ?? '',
      vin: json['vin'] ?? '',
      brand: json['brand'] ?? '',
      model: json['model'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    "currentMileage": currentMileage,
    "name": name,
    "vin": vin,
    "brand": brand,
    "model": model,
  };
}

class User {
  final String name;

  User({required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

class Part {
  final String name;
  final String number;
  final double price;
  final int quantity;

  Part({
    required this.name,
    required this.number,
    required this.price,
    required this.quantity,
  });

  factory Part.fromJson(Map<String, dynamic> json) {
    return Part(
      name: json['name'] ?? '',
      number: json['number'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      quantity: json['quantity'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "number": number,
    "price": price,
    "quantity": quantity,
  };
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

  Map<String, dynamic> toJson() => {
    "page": page,
    "limit": limit,
    "total": total,
    "totalPage": totalPage,
  };
}
