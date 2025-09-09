class ApiUrls {
  // static const String _baseUrl = "http://172.252.13.78:5013/api/v1";
  static const String _baseUrl = "http://10.0.20.216:5013/api/v1";


  static const String baseUrlForImage = "http://10.0.20.216:5013";

  static const String loginUrl = "$_baseUrl/auth/login";
  static const String registerUrl = "$_baseUrl/auth/register";

  static const String verifyPhoneUrl = "$_baseUrl/auth/verify-phone";
  static const String resetPasswordUrl = "$_baseUrl/auth/reset-password";

  // car owner url

  static const String getProfile = "$_baseUrl/users/me";
  static const String getAllCar = "$_baseUrl/vehicles/my";
  static const String getRecentService =
      "$_baseUrl/services?sort=createdAt&limit=5";
  static const String getGarageList = "$_baseUrl/users/garage-list?limit=50";
  static const String requestServicePost = "$_baseUrl/services";

  //car buyer url
  static const String changePassword = "$_baseUrl/auth/change-password";
  static const String updateProfile = "$_baseUrl/users/update-profile";
  static const String dealerVehicle = "$_baseUrl/vehicles/my";

  static String searchVin(String vin) => "$_baseUrl/vehicles/vin/$vin";
  static String singleVehicle(String id) => "$_baseUrl/vehicles/id/$id";
  static String vehicleSearch (String search) => "$_baseUrl/vehicles/my?searchTerm=$search";

  static String serviceHistory(String vin) =>
      "$_baseUrl/services/service-history/$vin";

  static String ownerHistory(String vin) =>
      "$_baseUrl/vehicles/owner-history/$vin";

  static String vehicleHistoryByOwner(String vin, String id) =>
      "$_baseUrl/vehicles/history/owner?vin=$vin&ownerId=$id";

  static const String uploadImage = "$_baseUrl/assets/upload-multiple";
  static const String addVehicles = "$_baseUrl/vehicles";
}
