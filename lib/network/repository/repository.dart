import 'dart:convert';

import 'package:cartgeek_test/network/model/home_model.dart';
import 'package:http/http.dart' as http;

class Repository {

  static Future<HomeResModel> homeRepo() async {
    final url = Uri.parse('http://cgprojects.in/flutter/');

    try {
      final response = await http.get(url);
      final result = HomeResModel.fromJson(jsonDecode(response.body));
      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
