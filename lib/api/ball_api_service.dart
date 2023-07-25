import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:surf_practice_magic_ball/model/biased_fortune_model.dart';

class ApiService {
  final String _baseUrl = "https://eightballapi.com";

  Future<String> getRandomFortune() async {
    final response = await http.get(Uri.parse("$_baseUrl/api"));

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);

      // Возвращает строку предсказания
      return result['reading'];
    } else {
      throw Exception('Failed to load fortune');
    }
  }

  Future<BiasedFortune> getBiasedFortune(String question,
      {bool lucky = true}) async {
    final response = await http
        .get(Uri.parse("$_baseUrl/api/biased?question=$question&lucky=$lucky"));

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);

      // Создание и возврат нового объекта BiasedFortune
      return BiasedFortune.fromJson(result);
    } else {
      throw Exception('Failed to load fortune');
    }
  }
}
