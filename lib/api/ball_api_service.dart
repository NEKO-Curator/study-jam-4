import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:surf_practice_magic_ball/model/biased_fortune_model.dart';

class ApiService {
  Future<String> getRandomFortune() async {
    final response =
        await http.get(Uri.parse('https://www.eightballapi.com/api'));

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      // Возвращает строку предсказания
      return result['reading'];
    } else {
      throw Exception('Failed to load fortune');
    }
  }
}
