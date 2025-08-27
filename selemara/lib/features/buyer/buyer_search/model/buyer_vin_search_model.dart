class VehicleModel {
  final String? id;
  final String? uniqueId;
  final String? oldDataId;
  final String? newDataId;
  final String? buyerId;
  final String? vin;
  final String? name;
  final String? brand;
  final String? model;
  final String? year;
  final String? color;
  final int? currentMileage;
  final List<String>? documents;
  final List<String>? images;
  final String? ownerId;
  final DateTime? warrantyExpireAt;
  final double? price;
  final double? sellPrice;
  final DateTime? sellAt;
  final DateTime? buyAt;
  final bool? isSold;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  VehicleModel({
    this.id,
    this.uniqueId,
    this.oldDataId,
    this.newDataId,
    this.buyerId,
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
    this.warrantyExpireAt,
    this.price,
    this.sellPrice,
    this.sellAt,
    this.buyAt,
    this.isSold,
    this.createdAt,
    this.updatedAt,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      id: json['id'],
      uniqueId: json['uniqueId'],
      oldDataId: json['oldDataId'],
      newDataId: json['newDataId'],
      buyerId: json['buyerId'],
      vin: json['vin'],
      name: json['name'],
      brand: json['brand'],
      model: json['model'],
      year: json['year'],
      color: json['color'],
      currentMileage: json['currentMileage'],
      documents: json['documents'] != null
          ? List<String>.from(json['documents'])
          : [],
      images: json['images'] != null
          ? List<String>.from(json['images'])
          : [],
      ownerId: json['ownerId'],
      warrantyExpireAt: json['warrantyExpireAt'] != null
          ? DateTime.tryParse(json['warrantyExpireAt'])
          : null,
      price: json['price'] != null ? (json['price'] as num).toDouble() : null,
      sellPrice:
      json['sellPrice'] != null ? (json['sellPrice'] as num).toDouble() : null,
      sellAt: json['sellAt'] != null ? DateTime.tryParse(json['sellAt']) : null,
      buyAt: json['buyAt'] != null ? DateTime.tryParse(json['buyAt']) : null,
      isSold: json['isSold'],
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "uniqueId": uniqueId,
      "oldDataId": oldDataId,
      "newDataId": newDataId,
      "buyerId": buyerId,
      "vin": vin,
      "name": name,
      "brand": brand,
      "model": model,
      "year": year,
      "color": color,
      "currentMileage": currentMileage,
      "documents": documents,
      "images": images,
      "ownerId": ownerId,
      "warrantyExpireAt": warrantyExpireAt?.toIso8601String(),
      "price": price,
      "sellPrice": sellPrice,
      "sellAt": sellAt?.toIso8601String(),
      "buyAt": buyAt?.toIso8601String(),
      "isSold": isSold,
      "createdAt": createdAt?.toIso8601String(),
      "updatedAt": updatedAt?.toIso8601String(),
    };
  }
}
