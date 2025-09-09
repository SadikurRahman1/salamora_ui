class SingleVehicle {
  final String id;
  final String vin;
  final String name;
  final String brand;
  final String model;
  final String year;
  final String color;
  final int currentMileage;
  final String? ownerId;
  final bool isSold;
  final bool isVerified;
  final List<String> images;
  final List<Document> documents;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  // 🔹 নতুন ফিল্ডগুলো
  final String? oldDataId;
  final String? newDataId;
  final String? buyerId;
  final DateTime? warrantyExpireAt;
  final double? price;
  final double? sellPrice;
  final DateTime? sellAt;
  final DateTime? buyAt;

  SingleVehicle({
    required this.id,
    required this.vin,
    required this.name,
    required this.brand,
    required this.model,
    required this.year,
    required this.color,
    required this.currentMileage,
    this.ownerId,
    required this.isSold,
    required this.isVerified,
    required this.images,
    required this.documents,
    this.createdAt,
    this.updatedAt,
    this.oldDataId,
    this.newDataId,
    this.buyerId,
    this.warrantyExpireAt,
    this.price,
    this.sellPrice,
    this.sellAt,
    this.buyAt,
  });

  factory SingleVehicle.fromJson(Map<String, dynamic> json) {
    return SingleVehicle(
      id: json['id'] ?? '',
      vin: json['vin'] ?? '',
      name: json['name'] ?? '',
      brand: json['brand'] ?? '',
      model: json['model'] ?? '',
      year: json['year'] ?? '',
      color: json['color'] ?? '',
      currentMileage: json['currentMileage'] ?? 0,
      ownerId: json['ownerId'],
      isSold: json['isSold'] ?? false,
      isVerified: json['isVerified'] ?? false,
      images: List<String>.from(json['images'] ?? []),
      documents: (json['documents'] as List<dynamic>?)
          ?.map((e) => Document.fromJson(e))
          .toList() ??
          [],
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,

      // 🔹 নতুন ফিল্ড map করা হলো
      oldDataId: json['oldDataId'],
      newDataId: json['newDataId'],
      buyerId: json['buyerId'],
      warrantyExpireAt: json['warrantyExpireAt'] != null
          ? DateTime.tryParse(json['warrantyExpireAt'])
          : null,
      price: (json['price'] != null)
          ? (json['price'] as num).toDouble()
          : null,
      sellPrice: (json['sellPrice'] != null)
          ? (json['sellPrice'] as num).toDouble()
          : null,
      sellAt: json['sellAt'] != null
          ? DateTime.tryParse(json['sellAt'])
          : null,
      buyAt: json['buyAt'] != null
          ? DateTime.tryParse(json['buyAt'])
          : null,
    );
  }
}

class Document {
  final String name;
  final String url;

  Document({required this.name, required this.url});

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      name: json['name'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
