class ServiceHistoryItem {
  final String id;
  final String vehicleUniqueId;
  final String serviceType;
  final String garageSideStatus;
  final String urgencyLevel;
  final String description;
  final Garage? garage;
  final DateTime? preferredDate;
  final DateTime? createdAt;
  final int estimatedCost;
  final String vehicleId;
  final String garageId;
  final Vehicle? vehicle;

  ServiceHistoryItem({
    this.id = '',
    this.vehicleUniqueId = '',
    this.serviceType = '',
    this.garageSideStatus = '',
    this.urgencyLevel = '',
    this.description = '',
    this.garage,
    this.preferredDate,
    this.createdAt,
    this.estimatedCost = 0,
    this.vehicleId = '',
    this.garageId = '',
    this.vehicle,
  });

  factory ServiceHistoryItem.fromJson(Map<String, dynamic> json) =>
      ServiceHistoryItem(
        id: json['id'] ?? '',
        vehicleUniqueId: json['vehicleUniqueId'] ?? '',
        serviceType: json['serviceType'] ?? '',
        garageSideStatus: json['garageSideStatus'] ?? '',
        urgencyLevel: json['urgencyLevel'] ?? '',
        description: json['description'] ?? '',
        garage: json['garage'] != null ? Garage.fromJson(json['garage']) : null,
        preferredDate: json['preferredDate'] != null
            ? DateTime.tryParse(json['preferredDate'])
            : null,
        createdAt: json['createdAt'] != null
            ? DateTime.tryParse(json['createdAt'])
            : null,
        estimatedCost: json['estimatedCost'] ?? 0,
        vehicleId: json['vehicleId'] ?? '',
        garageId: json['garageId'] ?? '',
        vehicle:
        json['vehicle'] != null ? Vehicle.fromJson(json['vehicle']) : null,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'vehicleUniqueId': vehicleUniqueId,
    'serviceType': serviceType,
    'garageSideStatus': garageSideStatus,
    'urgencyLevel': urgencyLevel,
    'description': description,
    'garage': garage?.toJson(),
    'preferredDate': preferredDate?.toIso8601String(),
    'createdAt': createdAt?.toIso8601String(),
    'estimatedCost': estimatedCost,
    'vehicleId': vehicleId,
    'garageId': garageId,
    'vehicle': vehicle?.toJson(),
  };
}

class Garage {
  final Business? business;

  Garage({this.business});

  factory Garage.fromJson(Map<String, dynamic> json) =>
      Garage(business: json['business'] != null
          ? Business.fromJson(json['business'])
          : null);

  Map<String, dynamic> toJson() => {'business': business?.toJson()};
}

class Business {
  final String businessName;
  final String businessType;
  final String website;

  Business({
    this.businessName = '',
    this.businessType = '',
    this.website = '',
  });

  factory Business.fromJson(Map<String, dynamic> json) => Business(
    businessName: json['businessName'] ?? '',
    businessType: json['businessType'] ?? '',
    website: json['website'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    'businessName': businessName,
    'businessType': businessType,
    'website': website,
  };
}

class Vehicle {
  final int currentMileage;
  final String name;
  final String vin;
  final String brand;
  final String model;

  Vehicle({
    this.currentMileage = 0,
    this.name = '',
    this.vin = '',
    this.brand = '',
    this.model = '',
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
    currentMileage: json['currentMileage'] ?? 0,
    name: json['name'] ?? '',
    vin: json['vin'] ?? '',
    brand: json['brand'] ?? '',
    model: json['model'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    'currentMileage': currentMileage,
    'name': name,
    'vin': vin,
    'brand': brand,
    'model': model,
  };
}
