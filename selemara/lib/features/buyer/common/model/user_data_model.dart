class BuyerModel {
  final String id;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;

  BuyerModel({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BuyerModel.fromJson(Map<String, dynamic> json) {
    return BuyerModel(
      id: json['id'],
      userId: json['userId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userId": userId,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
    };
  }
}

class UserDataModel {
  final String id;
  final String name;
  final String email;
  final String role;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? bio;
  final String phoneNumber;
  final String? profile;
  final BuyerModel? buyer;

  UserDataModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    this.bio,
    required this.phoneNumber,
    this.profile,
    this.buyer,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      bio: json['bio'],
      phoneNumber: json['phoneNumber'],
      profile: json['profile'],
      buyer: json['buyer'] != null ? BuyerModel.fromJson(json['buyer']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "role": role,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
      "bio": bio,
      "phoneNumber": phoneNumber,
      "profile": profile,
      "buyer": buyer?.toJson(),
    };
  }
}
