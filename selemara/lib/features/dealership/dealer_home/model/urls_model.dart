import 'dart:convert';

class FileUrl {
  String? name;
  String? url;

  FileUrl({this.name, this.url});

  static List<FileUrl> parseUploadResponse(String respStr) {
    try {
      final jsonData = jsonDecode(respStr);
      final urls = jsonData['data']['urls'] as List<dynamic>;
      return urls
          .map((e) => FileUrl(name: e['name'], url: e['url']))
          .toList();
    } catch (e) {
      print("Error parsing upload response: $e");
      return [];
    }
  }
}