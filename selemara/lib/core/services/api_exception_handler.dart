import 'package:http/http.dart' as http;

class ApiExceptionHandler {
  static String parse(Object exception) {
    if (exception is http.ClientException) {
      return "Connection failed. Please check your internet.";
    } else if (exception.toString().contains('TimeoutException')) {
      return "Request timed out. Please try again.";
    } else {
      return "Unexpected error occurred.";
    }
  }
}
