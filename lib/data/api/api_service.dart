import 'dart:convert';

import '../model/user.dart';
import 'package:http/http.dart' as http;

class ApiService{
  static const _baseUrl = 'https://reqres.in/api/users';
  List<Map<String, dynamic>> users = [];

  Future<User> fetchUserList({int page = 1, int perPage = 10}) async {
    final response = await http.get(Uri.parse('$_baseUrl?page=$page&per_page=$perPage'));
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user list');
    }
  }
}