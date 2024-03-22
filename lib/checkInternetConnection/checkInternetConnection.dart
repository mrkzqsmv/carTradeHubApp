import 'dart:io';
import 'package:flutter/material.dart';

class InternetConnectionCheckService with ChangeNotifier {
  static Future<bool> isInternetAvailable() async {
    try {
      final response =
          await HttpClient().getUrl(Uri.parse("http://google.com/"));
      final httpResponse = await response.close();
      if (httpResponse.statusCode == HttpStatus.ok) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
