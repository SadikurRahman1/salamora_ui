// class OwnerDetails {
//   final String? id;
//   final String? name;
//   final String? location;
//   final String? business;
//   final String? createdAt;
//   final String? sellAt;
//   final String? buyAt;
//   final int? currentMileage;
//   final List<MyService>? myServices;
//
//   OwnerDetails({
//     this.id,
//     this.name,
//     this.location,
//     this.business,
//     this.createdAt,
//     this.sellAt,
//     this.buyAt,
//     this.currentMileage,
//     this.myServices,
//   });
//
//   // factory OwnerDetails.fromJson(Map<String, dynamic> json) {
//   //   final ownerMap = json['owner'] as Map<String, dynamic>?;
//   //
//   //   return OwnerDetails(
//   //     id: ownerMap?['id'],
//   //     name: ownerMap?['name'],
//   //     location: ownerMap?['location'],
//   //     business: ownerMap?['business'],
//   //     createdAt: json['createdAt'],
//   //     sellAt: json['sellAt'],
//   //     buyAt: json['buyAt'],
//   //     currentMileage: json['currentMileage'],
//   //     myServices: json['myServices'] != null
//   //         ? (json['myServices'] as List)
//   //         .map((e) => MyService.fromJson(e))
//   //         .toList()
//   //         : [],
//   //   );
//   // }
//   factory OwnerDetails.fromJson(Map<String, dynamic> json) {
//     final ownerMap = json['owner'] as Map<String, dynamic>?;
//
//     return OwnerDetails(
//       id: ownerMap != null ? ownerMap['id'] as String? : null,
//       name: ownerMap != null ? ownerMap['name'] as String? : null,
//       location: ownerMap != null ? ownerMap['location'] as String? : null,
//       business: ownerMap != null ? ownerMap['business'] as String? : null,
//       createdAt: json['createdAt'] != null ? json['createdAt'] as String : null,
//       sellAt: json['sellAt'] != null ? json['sellAt'] as String : null,
//       buyAt: json['buyAt'] != null ? json['buyAt'] as String : null,
//       currentMileage: json['currentMileage'] != null
//           ? (json['currentMileage'] as num).toInt()
//           : null,
//       myServices: json['myServices'] != null
//           ? (json['myServices'] as List)
//           .map((e) => MyService.fromJson(e as Map<String, dynamic>))
//           .toList()
//           : [],
//     );
//   }
//
//
//   Map<String, dynamic> toJson() {
//     return {
//       "id": id,
//       "name": name,
//       "location": location,
//       "business": business,
//       "createdAt": createdAt,
//       "sellAt": sellAt,
//       "buyAt": buyAt,
//       "currentMileage": currentMileage,
//       "myServices": myServices?.map((e) => e.toJson()).toList(),
//     };
//   }
// }
//
// class MyService {
//   final String? serviceType;
//   final String? createdAt;
//   final Garage? garage;
//
//   MyService({this.serviceType, this.createdAt, this.garage});
//
//   factory MyService.fromJson(Map<String, dynamic> json) {
//     return MyService(
//       serviceType: json['serviceType'],
//       createdAt: json['createdAt'],
//       garage: json['garage'] != null ? Garage.fromJson(json['garage']) : null,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       "serviceType": serviceType,
//       "createdAt": createdAt,
//       "garage": garage?.toJson(),
//     };
//   }
// }
//
// class Garage {
//   final String? id;
//   final Business? business;
//
//   Garage({this.id, this.business});
//
//   factory Garage.fromJson(Map<String, dynamic> json) {
//     return Garage(
//       id: json['id'],
//       business: json['business'] != null ? Business.fromJson(json['business']) : null,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       "id": id,
//       "business": business?.toJson(),
//     };
//   }
// }
//
// class Business {
//   final String? location;
//
//   Business({this.location});
//
//   factory Business.fromJson(Map<String, dynamic> json) {
//     return Business(
//       location: json['location'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       "location": location,
//     };
//   }
// }
class OwnerDetails {
  final String? id;
  final String? name;
  final String? location;
  final Business? business;
  final String? createdAt;
  final String? sellAt;
  final String? buyAt;
  final double? currentMileage;
  final List<MyService>? myServices;

  OwnerDetails({
    this.id,
    this.name,
    this.location,
    this.business,
    this.createdAt,
    this.sellAt,
    this.buyAt,
    this.currentMileage,
    this.myServices,
  });

  factory OwnerDetails.fromJson(Map<String, dynamic> json) {
    final ownerMap = json['owner'] as Map<String, dynamic>?;

    return OwnerDetails(
      id: ownerMap?['id'] as String?,
      name: ownerMap?['name'] as String?,
      location: ownerMap?['location'] as String?,
      business: ownerMap?['business'] != null
          ? Business.fromJson(ownerMap?['business'] as Map<String, dynamic>)
          : null,
      createdAt: json['createdAt'] as String?,
      sellAt: json['sellAt'] as String?,
      buyAt: json['buyAt'] as String?,
      currentMileage: json['currentMileage'] != null
          ? (json['currentMileage'] as num).toDouble()
          : null,
      myServices: json['myServices'] != null
          ? (json['myServices'] as List)
          .map((e) => MyService.fromJson(e as Map<String, dynamic>))
          .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "location": location,
      "business": business?.toJson(),
      "createdAt": createdAt,
      "sellAt": sellAt,
      "buyAt": buyAt,
      "currentMileage": currentMileage,
      "myServices": myServices?.map((e) => e.toJson()).toList(),
    };
  }
}

class MyService {
  final String? serviceType;
  final String? createdAt;
  final Garage? garage;

  MyService({this.serviceType, this.createdAt, this.garage});

  factory MyService.fromJson(Map<String, dynamic> json) {
    return MyService(
      serviceType: json['serviceType'] as String?,
      createdAt: json['createdAt'] as String?,
      garage: json['garage'] != null
          ? Garage.fromJson(json['garage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "serviceType": serviceType,
      "createdAt": createdAt,
      "garage": garage?.toJson(),
    };
  }
}

class Garage {
  final String? id;
  final Business? business;

  Garage({this.id, this.business});

  factory Garage.fromJson(Map<String, dynamic> json) {
    return Garage(
      id: json['id'] as String?,
      business: json['business'] != null
          ? Business.fromJson(json['business'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "business": business?.toJson(),
    };
  }
}

class Business {
  final String? location;
  final String? businessName;
  final String? businessType;
  final String? website;

  Business({this.location, this.businessName, this.businessType, this.website});

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      location: json['location'] as String?,
      businessName: json['businessName'] as String?,
      businessType: json['businessType'] as String?,
      website: json['website'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "location": location,
      "businessName": businessName,
      "businessType": businessType,
      "website": website,
    };
  }
}
