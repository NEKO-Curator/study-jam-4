import 'package:surf_practice_magic_ball/model/sentiment_model.dart';

class BiasedFortune {
  final String reading;
  final String question;
  final Sentiment sentiment;

  BiasedFortune(
      {required this.reading, required this.question, required this.sentiment});

  factory BiasedFortune.fromJson(Map<String, dynamic> json) {
    return BiasedFortune(
      reading: json['reading'],
      question: json['question'],
      sentiment: Sentiment.fromJson(json['sentiment']),
    );
  }
}
