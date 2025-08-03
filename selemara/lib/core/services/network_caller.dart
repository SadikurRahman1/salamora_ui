import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:selemara/core/constants/token_key.dart';
import 'package:selemara/core/helper/shared_preferences_helper.dart';
import 'package:selemara/core/services/api_exception_handler.dart';
import 'package:selemara/core/services/response_data.dart';

class NetworkCaller extends GetxService {
  static const Duration _timeout = Duration(seconds: 30);
  final Map<String, String> _defaultHeaders = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  Future<ResponseData> getRequest(
    String url, {
    bool requireAuth = false,
  }) async {
    try {
      final headers = await _buildHeaders(requireAuth);
      final response = await http
          .get(Uri.parse(url), headers: headers)
          .timeout(_timeout);

      return _processResponse(response);
    } catch (e) {
      return ResponseData.error(ApiExceptionHandler.parse(e));
    }
  }

  Future<ResponseData> postRequest(
    String url,
    Map<String, dynamic> body, {
    bool requireAuth = false,
  }) async {
    try {
      final headers = await _buildHeaders(requireAuth);
      final response = await http
          .post(Uri.parse(url), headers: headers, body: jsonEncode(body))
          .timeout(_timeout);

      return _processResponse(response);
    } catch (e) {
      return ResponseData.error(ApiExceptionHandler.parse(e));
    }
  }

  Future<ResponseData> putRequest(
    String url,
    Map<String, dynamic> body, {
    bool requireAuth = false,
  }) async {
    try {
      final headers = await _buildHeaders(requireAuth);
      final response = await http
          .put(Uri.parse(url), headers: headers, body: jsonEncode(body))
          .timeout(_timeout);

      return _processResponse(response);
    } catch (e) {
      return ResponseData.error(ApiExceptionHandler.parse(e));
    }
  }

  Future<ResponseData> postFormData(
    String url,
    Map<String, String> fields, {
    http.MultipartFile? file,
    bool requireAuth = false,
  }) async {
    try {
      final headers = await _buildHeaders(requireAuth, isMultipart: true);
      final request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(headers);
      request.fields.addAll(fields);
      if (file != null) request.files.add(file);

      final response = await http.Response.fromStream(await request.send());

      return _processResponse(response);
    } catch (e) {
      return ResponseData.error(ApiExceptionHandler.parse(e));
    }
  }

  Future<Map<String, String>> _buildHeaders(
    bool requireAuth, {
    bool isMultipart = false,
  }) async {
    final headers = Map<String, String>.from(_defaultHeaders);
    if (isMultipart) {
      headers['Content-Type'] = 'multipart/form-data';
    }

    if (requireAuth) {
      final token = SharedPreferencesHelper.readString(TokenKey.accessToken);
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }

    return headers;
  }

  ResponseData _processResponse(http.Response response) {
    final statusCode = response.statusCode;
    final decoded = jsonDecode(response.body);

    if (statusCode >= 200 && statusCode < 300) {
      return ResponseData.success(decoded, statusCode: statusCode);
    } else {
      final error = decoded['message'] ?? 'Something went wrong';
      return ResponseData.error(error.toString(), statusCode: statusCode);
    }
  }
}
