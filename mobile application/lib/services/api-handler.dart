import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiHandler {
  static String ngrokLink = "";

  static Future<void> getNgrokLink() async {
    // final response =
    await http
        .get(Uri.parse(
            'https://seif-el-deen.github.io/Json-Files/Arabic-Sign-Language-Api-Link.json'))
        .then((value) {
      if (value.statusCode == 200) {
        // Parse the JSON response
        final jsonData = json.decode(value.body);
        // print(jsonData["link"]);

        ngrokLink = jsonData["link"];
        // print(ngrokLink);
      }
    }).catchError((error) {
      // print(error);
    });
  }

  static Future<String> uploadVideo({required String filePath}) async {
    final request = http.MultipartRequest("POST", Uri.parse(ngrokLink));
    // final headers = {"Content-type": "multipart/form-data"};

    request.files.add(await http.MultipartFile.fromPath('video', filePath));

    // print(filePath);
    var response = await request.send();

    // print("Status Code:  ${response.statusCode}");

    if (response.statusCode == 200) {
      String val = await response.stream.bytesToString();
      // print(val);
      return val;
    } else {
      throw Exception('Failed to upload video');
    }
  }
}
