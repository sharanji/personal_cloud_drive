import 'dart:convert';

import 'package:google_drive_clone/main.dart';
import 'package:google_drive_clone/models/file.dart';
import 'package:google_drive_clone/models/logindetails.dart';
import 'package:http/http.dart' as http;
import 'package:google_drive_clone/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FileRepository {
  static Future<List<FileModel>?> fetchFiles(int parentId) async {
    var response = await http.get(
      Uri.parse('${Urls.userFiles}$userId/$parentId'),
    );

    if (response.statusCode != 200) {
      return null;
    }

    var responseBody = jsonDecode(response.body);
    List<FileModel> files = [];
    for (var i = 0; i < responseBody['files'].length; i++) {
      files.add(FileModel.fromJson(responseBody['files'][i]));
    }

    return files;
  }
}
