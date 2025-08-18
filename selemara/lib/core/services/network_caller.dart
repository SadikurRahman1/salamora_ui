import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:selemara/core/constants/token_key.dart';
import 'package:selemara/core/helper/shared_preferences_helper.dart';
import 'package:selemara/core/routes/app_routes.dart';
import 'package:selemara/core/services/response_data.dart';

class NetworkCaller {
  final http.Client _client = http.Client();
  final SharedPreferencesHelper _preferencesHelper = SharedPreferencesHelper();

  Future<ResponseData> getRequest(
    String url, {
    Map<String, String>? queryParams,
  }) async {
    try {
      final uri = Uri.parse(url).replace(queryParameters: queryParams);
      final headers = await _buildHeaders();

      final response = await _client.get(uri, headers: headers);
      return _handleResponse(response);
    } catch (e) {
      return ResponseData(isSuccess: false, message: e.toString());
    }
  }

  Future<ResponseData> postRequest({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    try {
      final headers = await _buildHeaders();
      final response = await _client.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );
      return _handleResponse(response);
    } catch (e) {
      return ResponseData(isSuccess: false, message: e.toString());
    }
  }

  Future<ResponseData> putRequest({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    try {
      final headers = await _buildHeaders();
      final response = await _client.put(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );
      return _handleResponse(response);
    } catch (e) {
      return ResponseData(isSuccess: false, message: e.toString());
    }
  }

  Future<ResponseData> postMultipartRequest(
    String url, {
    Map<String, String>? fields,
    Map<String, File>? files,
  }) async {
    try {
      final uri = Uri.parse(url);
      final request = http.MultipartRequest('POST', uri);

      final token = _preferencesHelper.getString(TokenKey.accessToken);
      if (token != null) {
        request.headers['Authorization'] = token;
      }

      if (fields != null) {
        request.fields.addAll(fields);
      }

      if (files != null) {
        for (final entry in files.entries) {
          final mimeType =
              lookupMimeType(entry.value.path) ?? 'application/octet-stream';
          final file = await http.MultipartFile.fromPath(
            entry.key,
            entry.value.path,
            contentType: MediaType.parse(mimeType),
          );
          request.files.add(file);
        }
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      return _handleResponse(response);
    } catch (e) {
      return ResponseData(isSuccess: false, message: e.toString());
    }
  }

  Future<ResponseData> patchRequest({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    try {
      final headers = await _buildHeaders();
      final response = await _client.patch(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );
      return _handleResponse(response);
    } catch (e) {
      return ResponseData(isSuccess: false, message: e.toString());
    }
  }

  Future<Map<String, String>> _buildHeaders({bool withToken = true}) async {
    final headers = <String, String>{'Content-Type': 'application/json'};
    if (withToken) {
      final token = _preferencesHelper.getString(TokenKey.accessToken);
      if (token != null && token.isNotEmpty) {
        headers['Authorization'] = token;
      }
    }
    return headers;
  }

  Future<ResponseData> _handleResponse(http.Response response) async {
    try {
      final decoded = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return ResponseData(isSuccess: true, data: decoded);
      } else if (response.statusCode == 401) {
      //redirect to the login page
      
      await _preferencesHelper.remove(TokenKey.accessToken);
      await _preferencesHelper.remove(TokenKey.userId);
      await _preferencesHelper.remove(TokenKey.role);

      Get.offAllNamed(AppRoutes.login);
      return ResponseData(
        isSuccess: false,
        message: 'Unauthorized access. Redirecting to login.',
      );
      }
      else {
        return ResponseData(
          isSuccess: false,
          message: decoded['message'] ?? 'Unknown error',
        );
      }
    } catch (e) {
      return ResponseData(
        isSuccess: false,
        message: 'Failed to parse response: ${response.body}',
      );
    }
  }

  void dispose() {
    _client.close();
  }
}
