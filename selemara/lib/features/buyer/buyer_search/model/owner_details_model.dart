class OwnerDetails {
  final bool success;
  final int statusCode;
  final String message;
  final OwnerData data;

  OwnerDetails({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory OwnerDetails.fromJson(Map<String, dynamic> json) {
    return OwnerDetails(
      success: json['success'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: OwnerData.fromJson(json['data']),
    );
  }
}

class OwnerData {
  final Owner owner;
  final DateTime createdAt;
  final DateTime? sellAt;
  final int currentMileage;
  final DateTime? buyAt;
  final List<Service> myServices;

  OwnerData({
    required this.owner,
    required this.createdAt,
    this.sellAt,
    required this.currentMileage,
    this.buyAt,
    required this.myServices,
  });

  factory OwnerData.fromJson(Map<String, dynamic> json) {
    return OwnerData(
      owner: Owner.fromJson(json['owner']),
      createdAt: DateTime.parse(json['createdAt']),
      sellAt: json['sellAt'] != null ? DateTime.parse(json['sellAt']) : null,
      currentMileage: json['currentMileage'],
      buyAt: json['buyAt'] != null ? DateTime.parse(json['buyAt']) : null,
      myServices: json['myServices'] != null
          ? List<Service>.from(json['myServices'].map((x) => Service.fromJson(x)))
          : [],
    );
  }
}

class Owner {
  final String id;
  final String name;
  final String? location;
  final String? business;

  Owner({
    required this.id,
    required this.name,
    this.location,
    this.business,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      business: json['business'],
    );
  }
}

class Service {
  final String serviceType;
  final DateTime createdAt;
  final Garage garage;

  Service({
    required this.serviceType,
    required this.createdAt,
    required this.garage,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      serviceType: json['serviceType'],
      createdAt: DateTime.parse(json['createdAt']),
      garage: Garage.fromJson(json['garage']),
    );
  }
}

class Garage {
  final String id;
  final Business business;

  Garage({required this.id, required this.business});

  factory Garage.fromJson(Map<String, dynamic> json) {
    return Garage(
      id: json['id'],
      business: Business.fromJson(json['business']),
    );
  }
}

class Business {
  final String? location;

  Business({this.location});

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(location: json['location']);
  }
}
