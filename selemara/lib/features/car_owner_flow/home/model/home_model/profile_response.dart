class ProfileResponse {
  final bool success;
  final int statusCode;
  final String message;
  final ProfileData data;

  ProfileResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: ProfileData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'statusCode': statusCode,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class ProfileData {
  final String id;
  final String name;
  final String email;
  final String role;
  final String createdAt;
  final String updatedAt;
  final String? bio;
  final String? phoneNumber;
  final String? profile;
  final CarOwner carOwner;

  ProfileData({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    this.bio,
    this.phoneNumber,
    this.profile,
    required this.carOwner,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      bio: json['bio'],
      phoneNumber: json['phoneNumber'],
      profile: json['profile'],
      carOwner: CarOwner.fromJson(json['carOwner']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'bio': bio,
      'phoneNumber': phoneNumber,
      'profile': profile,
      'carOwner': carOwner.toJson(),
    };
  }
}

class CarOwner {
  final String id;
  final String userId;
  final String? emiratesId;
  final String? carRegistrationCard;
  final String createdAt;
  final String updatedAt;

  CarOwner({
    required this.id,
    required this.userId,
    this.emiratesId,
    this.carRegistrationCard,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CarOwner.fromJson(Map<String, dynamic> json) {
    return CarOwner(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      emiratesId: json['emiratesId'],
      carRegistrationCard: json['carRegistrationCard'],
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'emiratesId': emiratesId,
      'carRegistrationCard': carRegistrationCard,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
