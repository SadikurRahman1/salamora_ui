class UserDataModel {
  final String id;
  final String name;
  final String email;
  final String role;
  final String? bio;
  final String phoneNumber;
  final String? profile;
  final String createdAt;
  final String updatedAt;
  final Buyer? buyer;

  UserDataModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.bio,
    required this.phoneNumber,
    this.profile,
    required this.createdAt,
    required this.updatedAt,
    this.buyer,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      role: json["role"] ?? "",
      bio: json["bio"],
      phoneNumber: json["phoneNumber"] ?? "",
      profile: json["profile"],
      createdAt: json["createdAt"] ?? "",
      updatedAt: json["updatedAt"] ?? "",
      buyer: json["buyer"] != null ? Buyer.fromJson(json["buyer"]) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "role": role,
      "bio": bio,
      "phoneNumber": phoneNumber,
      "profile": profile,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "buyer": buyer?.toJson(),
    };
  }
}

class Buyer {
  final String id;
  final String userId;
  final String createdAt;
  final String updatedAt;

  Buyer({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Buyer.fromJson(Map<String, dynamic> json) {
    return Buyer(
      id: json["id"] ?? "",
      userId: json["userId"] ?? "",
      createdAt: json["createdAt"] ?? "",
      updatedAt: json["updatedAt"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userId": userId,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }
}
