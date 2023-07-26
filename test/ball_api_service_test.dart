import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:surf_practice_magic_ball/api/ball_api_service.dart';
import 'package:surf_practice_magic_ball/model/biased_fortune_model.dart';

void main() {
  var apiService = ApiService();

  group('ApiService Tests', () {
    test('getRandomFortune() returns a non-empty string', () async {
      final result = await apiService.getRandomFortune();
      expect(result.isNotEmpty, true);
      expect(result, isA<String>());
      if (kDebugMode) {
        print('Random Fortune Test: $result');
      }
    });
  });
}
