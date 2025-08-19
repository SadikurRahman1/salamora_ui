class ApiUrls {
  static const String _baseUrl = "http://172.252.13.78:5013/api/v1";
  static const String loginUrl = "$_baseUrl/auth/login";
  static const String registerUrl = "$_baseUrl/auth/register";

  static const String verifyPhoneUrl = "$_baseUrl/auth/verify-phone";
  static const String resetPasswordUrl = "$_baseUrl/auth/reset-password";






  // car owner url

  static const String getProfile = "$_baseUrl/users/me";
  static const String getAllCar = "$_baseUrl/vehicles/my";
  static const String getRecentService = "$_baseUrl/services?sort=createdAt&limit=5";
  static const String getGarageList = "$_baseUrl/users/garage-list?limit=50";
  static const String requestServicePost = "$_baseUrl/services";


  //car buyer url
  static const String changePassword = "$_baseUrl/auth/change-password";



}
