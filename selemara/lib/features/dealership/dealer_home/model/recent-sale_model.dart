class SoldVehicleResponseModel {
  final bool? success;
  final int? statusCode;
  final String? message;
  final SoldVehicleListData? data;

  SoldVehicleResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory SoldVehicleResponseModel.fromJson(Map<String, dynamic> json) {
    return SoldVehicleResponseModel(
      success: json['success'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'] != null
          ? SoldVehicleListData.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "success": success,
      "statusCode": statusCode,
      "message": message,
      "data": data?.toJson(),
    };
  }
}

class SoldVehicleListData {
  final List<SoldVehicleData>? data;
  final Meta? meta;

  SoldVehicleListData({this.data, this.meta});

  factory SoldVehicleListData.fromJson(Map<String, dynamic> json) {
    return SoldVehicleListData(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SoldVehicleData.fromJson(e))
          .toList(),
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "data": data?.map((e) => e.toJson()).toList(),
      "meta": meta?.toJson(),
    };
  }
}

class SoldVehicleData {
  final String? id;
  final String? ownerId;
  final String? vin;
  final DateTime? sellAt;
  final DateTime? warrantyExpireAt;
  final int? sellPrice;
  final String? buyerId;
  final bool? isVerified;
  final List<String>? images;
  final String? name;
  final Buyer? buyer;

  SoldVehicleData({
    this.id,
    this.ownerId,
    this.vin,
    this.sellAt,
    this.warrantyExpireAt,
    this.sellPrice,
    this.buyerId,
    this.isVerified,
    this.images,
    this.name,
    this.buyer,
  });

  factory SoldVehicleData.fromJson(Map<String, dynamic> json) {
    return SoldVehicleData(
      id: json['id'],
      ownerId: json['ownerId'],
      vin: json['vin'],
      sellAt: json['sellAt'] != null ? DateTime.parse(json['sellAt']) : null,
      warrantyExpireAt: json['warrantyExpireAt'] != null
          ? DateTime.parse(json['warrantyExpireAt'])
          : null,
      sellPrice: json['sellPrice'],
      buyerId: json['buyerId'],
      isVerified: json['isVerified'],
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      name: json['name'],
      buyer: json['buyer'] != null ? Buyer.fromJson(json['buyer']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "ownerId": ownerId,
      "vin": vin,
      "sellAt": sellAt?.toIso8601String(),
      "warrantyExpireAt": warrantyExpireAt?.toIso8601String(),
      "sellPrice": sellPrice,
      "buyerId": buyerId,
      "isVerified": isVerified,
      "images": images,
      "name": name,
      "buyer": buyer?.toJson(),
    };
  }
}

class Buyer {
  final String? name;
  final String? profile;
  final String? phoneNumber;
  final String? email;

  Buyer({this.name, this.profile, this.phoneNumber, this.email});

  factory Buyer.fromJson(Map<String, dynamic> json) {
    return Buyer(
      name: json['name'],
      profile: json['profile'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "profile": profile,
      "phoneNumber": phoneNumber,
      "email": email,
    };
  }
}

class Meta {
  final int? page;
  final int? limit;
  final int? total;
  final int? totalPage;

  Meta({this.page, this.limit, this.total, this.totalPage});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      page: json['page'],
      limit: json['limit'],
      total: json['total'],
      totalPage: json['totalPage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "page": page,
      "limit": limit,
      "total": total,
      "totalPage": totalPage,
    };
  }
}
