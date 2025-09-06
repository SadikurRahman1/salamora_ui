class VehicleOwnerHistoryResponse {
  final bool success;
  final int statusCode;
  final String message;
  final List<OwnerHistoryData> data;

  VehicleOwnerHistoryResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory VehicleOwnerHistoryResponse.fromJson(Map<String, dynamic> json) {
    return VehicleOwnerHistoryResponse(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => OwnerHistoryData.fromJson(e))
          .toList() ??
          [],
    );
  }
}

class OwnerHistoryData {
  final Owner? owner;
  final DateTime? createdAt;
  final int? currentMileage;
  final List<MyService> myServices;
  final String? vin;
  final bool? isCurrentOwner;
  final bool? isFirstOwner;
  final int? ownerNumber;

  OwnerHistoryData({
    this.owner,
    this.createdAt,
    this.currentMileage,
    required this.myServices,
    this.vin,
    this.isCurrentOwner,
    this.isFirstOwner,
    this.ownerNumber,
  });

  factory OwnerHistoryData.fromJson(Map<String, dynamic> json) {
    return OwnerHistoryData(
      owner: json["owner"] != null ? Owner.fromJson(json["owner"]) : null,
      createdAt: json["createdAt"] != null
          ? DateTime.tryParse(json["createdAt"])
          : null,
      currentMileage: json["currentMileage"],
      myServices: json["myServices"] != null
          ? List<MyService>.from(
          json["myServices"].map((e) => MyService.fromJson(e)))
          : [],
      vin: json["vin"],
      isCurrentOwner: json["isCurrentOwner"],
      isFirstOwner: json["isFirstOwner"],
      ownerNumber: json["ownerNumber"],
    );
  }
}

class Owner {
  final String? profile;
  final String? name;
  final String? id;

  Owner({
    this.profile,
    this.name,
    this.id,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      profile: json['profile'],
      name: json['name'],
      id: json['id'],
    );
  }
}

class MyService {
  final String? id;

  MyService({this.id});

  factory MyService.fromJson(Map<String, dynamic> json) {
    return MyService(
      id: json['id'],
    );
  }
}
