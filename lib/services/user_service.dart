import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jurnalku_mobile/models/user_model.dart';

class UserService {
  final String baseUrl = 'http://15.15.5.106:8000/api';

  Future<List<User>> fetchUsers() async {
    final url = Uri.parse('$baseUrl/users');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List jsonData = json.decode(response.body);
      return jsonData.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception('Gagal mengambil data users (${response.statusCode})');
    }
  }
}
